class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :prepare_decrypted_token
  before_filter :debug

  ###
  private
  ###

  # = フィルタで暗号化トークンを復号化し、環境変数としてセットする
  # Author:: oyajikun
  def prepare_decrypted_token
    request.env[:decrypted_token] = Crypt.to_hash(
      Crypt.config[:password], Crypt.config[:salt], params[:encrypted_token], ['_', '='])
  end

  def debug
    require "pp"
    pp request.mobile.carrier
    pp request.mobile.guid
    pp request.env[:decrypted_token]
  end
end
