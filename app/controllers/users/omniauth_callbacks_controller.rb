# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
 

  def facebook
    callback_for(:facebook) #コールバック
  end

  def google_oauth2
    callback_for(:google)
  end

  def failure
    redirect_to root_path and return
  end


  def callback_for(provider)
    info = User.find_oauth(request.env["omniauth.auth"]) #usersモデルのメソッド
    @user = info[:user]
    sns_id = info[:sns_id]
    if @user.persisted? #userが存在したら
      sign_in_and_redirect @user, event: :authentication
    else #userが存在しなかったら
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
      render template: "signup/step0_1"#redirect_to だと更新してしまうのでrenderで
    end
  end




end
 
 
 
 
 