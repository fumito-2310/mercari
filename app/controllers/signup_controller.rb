class SignupController < ApplicationController

  before_action :save_to_session_before_phone, only: :step2
  before_action :save_to_session_before_address, only: :step3
  before_action :save_to_session_before_credit, only: :create

def step0_1
  @user = User.new
end

def step0_2
  session[:nickname] = user_params[:nickname]
  session[:email] = user_params[:email]
  session[:password] = user_params[:password]
  session[:password_confirmation] = user_params[:password_confirmation]
  session[:first_name] = user_params[:first_name]
  session[:last_name] = user_params[:last_name]
  session[:first_name_kana] = user_params[:first_name_kana]
  session[:last_name_kana] = user_params[:last_name_kana]
  session[:birthdate_year] = user_params[:birth_year]
  session[:birthdate_month] = user_params[:birth_month]
  session[:birthdate_day] = user_params[:birth_day]
  session[:uid] = user_params[:uid]
  session[:provider] = user_params[:provider]
  @user = User.new
  
end


  def step1
    @user = User.new # 新規インスタンス作成
  end

  def step2
    @user = User.new # 新規インスタンス作成
  end

  def step3
    @user = User.new # 新規インスタンス作成
  end


  def create
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name],
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana], 
      birthdate_year: session[:birthdate_year], 
      birthdate_month: session[:birthdate_month], 
      birthdate_day: session[:birthdate_day], 
      phone_number: session[:phone_number], 

      address_number: session[:address_number], 
      address_prefecture: session[:address_prefecture], 
      address_name: session[:address_name], 
      address_block: session[:address_block], 
      address_building: session[:address_building], 
      address_phone_number: session[:address_phone_number], 
 
      reset_password_token: session[:reset_password_token], 
      reset_password_sent_at: session[:reset_password_sent_at], 
      remember_created_at: session[:remember_created_at], 

      provider: session[:provider],
      uid: session[:uid]
    )

    if @user.save
      sign_in(@user)
      redirect_to card_new_path
    else
      
      render action: "step1.html.haml"
  end
end



private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :phone_number,
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :birthdate_year,
      :birthdate_month,
      :birthdate_day,
      :address_number,
      :address_prefecture,
      :address_name,
      :address_block,
      :address_building,
      :address_phone_number,
      :provider,
      :uid,

      ## Recoverable
      :reset_password_token,
      :reset_password_sent_at,

      ## Rememberable
      :remember_created_at,
      )
  end


  def save_to_session_before_phone
       # step1で入力された値をsessionに保存
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthdate_year] = user_params[:birthdate_year]
    session[:birthdate_month] = user_params[:birthdate_month]
    session[:birthdate_day] = user_params[:birthdate_day]
  end

  def save_to_session_before_address
    # phoneで入力した値をsessionに保存
    session[:phone_number] = user_params[:phone_number]
  
  end

  def save_to_session_before_credit
    # addressで入力した値をsessionに保存
    session[:address_number] = user_params[:address_number]
    session[:address_prefecture] = user_params[:address_prefecture]
    session[:address_name] = user_params[:address_name]
    session[:address_block] = user_params[:address_block]
    session[:address_building] = user_params[:address_building]
    session[:address_phone_number] = user_params[:address_phone_number]
  end
end