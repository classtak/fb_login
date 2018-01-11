# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def auth
    request.env['omniauth.auth']
    #<OmniAuth::AuthHash
      # credentials=
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

  def facebook
    # auth hash는 위에 있는 주석
    # 만약에 유저가 facebook을 통해 회원가입을 한적이 있으면?
    service = Service.where(provider: auth.provider, uid: auth.uid).first
    if service.present?
    #   유저를 가져오면 된다.
      user = service.user # service belongs_to user / 그 서비스가 가지고 있는 유저를 가져오게 됩니다.
    # 아니면?
    else
      # 유저를 생성하면 된다.
      user = User.create(
        email: auth.info.email,
        password: Devise.friendly_token[0,20]
      )
    #  유저를 생성하면서, 서비스에 facebook 정보를 담아 놓는다.
      user.services.create(
        provider: auth.provider,
        uid: auth.uid,
        expires_at: Time.at(auth.credentials.expires_at),
        access_token: auth.credentials.token
      ) # Service.new 랑 같은데 user_id column에 user id 값이 들어간다.
    end
    sign_in_and_redirect user
  end
end
