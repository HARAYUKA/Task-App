class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  # 現ログインユーザーであるか
  def correct_user
    redirect_to root_url unless current_user?(@user)
  end
  
  def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインしてください。"
      redirect_to login_url
    end
  end
  
  def admin_user
    redirect_to root_url unless current_user.admin?
  end
  
  # 管理権限者かログインしているユーザーか
  def admin_or_correct_user
    unless current_user?(@user) || current_user.admin?
      flash[:danger] = "権限がありません。"
      redirect_to root_url
    end
  end
end
