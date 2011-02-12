class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :prepare_decrypted_token

  # = フィルタで暗号化トークンを復号化し、環境変数としてセットする
  # Author:: oyajikun
  def prepare_decrypted_token
    request.env["decrypted_token"] = Crypt.to_hash(
      Crypt.config[:password], Crypt.config[:salt], params[:encrypted_token], ['_', '='])
  end
end
