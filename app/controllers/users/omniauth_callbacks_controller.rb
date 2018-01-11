# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    p request.env['omniauth.auth']
    redirect_to root_path

    #<OmniAuth::AuthHash credentials=
    #<OmniAuth::AuthHash
      # expires=true
      # expires_at=1520820573
      # token="EAAeEJ4oR15MBAODiUtJtZCIAaZBNUgZBNKkwTntO6hVN9uSwVght7DDFYTntK1IFnFm97KhZAucLkNy9XnLdPrVX1Yn7OcKW7JadAnNBKV3NM3eXMmuw85ZBMXRYtlpf9ZCnugHQ09EnTxURwmmAWM7K8geUZATlWJWNdNhU8FYvwZDZD">
      # extra=#<OmniAuth::AuthHash raw_info=#<OmniAuth::AuthHash email="romancedandelion@gmail.com" id="1536995443063697" name="Takhee Kim">>
      # info=#<OmniAuth::AuthHash::InfoHash
      #   email="romancedandelion@gmail.com"
      #   image="http://graph.facebook.com/v2.6/1536995443063697/picture"
      #   name="Takhee Kim">
      # provider="facebook"
      # uid="1536995443063697">
  end
end
