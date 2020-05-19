class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  # 原ログインユーザーであるか
  def correct_user
    redirect_to root_url unless current_user?(@user)
  end
end
