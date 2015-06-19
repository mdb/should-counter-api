module AuthHelper
  def http_login
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(
      Rails.configuration.authorized_name,
      Rails.configuration.authorized_password)
  end
end
