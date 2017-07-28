class OauthController < ApplicationController
  skip_before_action :authenticate_user!

  def facebook
    token = HTTParty.post('https://graph.facebook.com/v2.8/oauth/access_token', {
      query: {
        client_id: ENV["FACEBOOK_APP_ID"],
        redirect_uri: (ENV["APP_URL"] || "http://localhost:7000") + "/",
        client_secret: ENV["FACEBOOK_APP_SECRET"],
        code: params[:code]
      },
      headers: { 'Accept' => 'application/json'}
      }).parsed_response


    profile = HTTParty.get('https://graph.facebook.com/v2.8/me?fields=id,name,email', {
      query: token,
      headers: {
        'User-Agent' => 'HTTParty',
        'Accept' => 'application/json'
      }
      }).parsed_response


        user = User.where("email = :email OR facebook_id = :facebook_id", email: profile["email"], facebook_id: profile["id"]).first

        user = User.new username: profile["name"], email: profile["email"] unless user

        user[:facebook_id] = profile["id"]

        if user.save
          token = Auth.issue({ id: user.id })
          render json: { user: UserSerializer.new(user), token: token }, status: :ok
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
  end
end
