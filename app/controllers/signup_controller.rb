class SignupController < ApplicationController
#   before_action :validates_step1, only: :step2 # step1のバリデーション
#   before_action :validates_step2, only: :step3 # step2のバリデーション
#   before_action :validates_step3, only: :step4 # step1のバリデーション
#   before_action :validates_step4, only: :done # step2のバリデーション


# # 各アクションごとに新規インスタンスを作成します
# def step1
#   @user = User.new # 新規インスタンス作成
# end

# def step2
#   @user = User.new # 新規インスタンス作成
# end

# def step3
#   @user = User.new # 新規インスタンス作成
# end

# def step4
#   @user = User.new # 新規インスタンス作成
# end

# def done
#   sign_in User.find(session[:id]) unless user_signed_in?
# end


# def validates_step1
#   # step1で入力された値をsessionに保存
#   session[:nickname] = user_params[:nickname]
#   session[:email] = user_params[:email]
#   session[:password] = user_params[:password]
#   session[:password_confirmation] = user_params[:password_confirmation]
# # バリデーション用に、仮でインスタンスを作成する
# @user = User.new(
#   nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
#   email: session[:email],
#   password: session[:password],
#   password_confirmation: session[:password_confirmation],
#   phone_number: "09012345678", # 入力前の情報は、バリデーションに通る値を仮で入れる
# )
# # 仮で作成したインスタンスのバリデーションチェックを行う
#   render '/signup/step1' unless @user.valid?
# end


# def validates_step2
#   # step2で入力された値をsessionに保存
#   session[:phone_number] = user_params[:phone_number]
#   # バリデーション用に、仮でインスタンスを作成する
#   @user = User.new(
#     nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
#     email: session[:email],
#     password: session[:password],
#     password_confirmation: session[:password_confirmation],
#     phone_number: session[:phone_number], 
#     last_name: "山田", # 入力前の情報は、バリデーションに通る値を仮で入れる
#     first_name: "太郎", 
#     last_name_kana: "ヤマダ", 
#     first_name_kana: "タロウ",
#     address_number:"123-4567",
#     address_prefecture:"北海道",
#     address_name:"横浜市緑区",
#     address_block:"青山1-1-1",
#     address_building:"柳ビル1-1",
#     address_phone_number:"08012345678",
#   )
#   # 仮で作成したインスタンスのバリデーションチェックを行う
#     render '/signup/step2' unless @user.valid?
# end


# def validates_step3
#   # step2で入力された値をsessionに保存
#   session[:last_name] = user_params[:last_name]
#   session[:first_name] = user_params[:first_name]
#   session[:last_name_kana] = user_params[:last_name_kana]
#   session[:first_name_kana] = user_params[:first_name_kana]
#   session[:address_number] = user_params[:address_number]
#   session[:address_prefecture] = user_params[:address_prefecture]
#   session[:address_name] = user_params[:address_name]
#   session[:address_block] = user_params[:address_block]
#   session[:address_building] = user_params[:address_building]
#   session[:address_phone_number] = user_params[:address_phone_number]  # バリデーション用に、仮でインスタンスを作成する
#   @user = User.new(
#     nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
#     email: session[:email],
#     password: session[:password],
#     password_confirmation: session[:password_confirmation],
#     phone_number: session[:phone_number], 
#     last_name: "山田", # 入力前の情報は、バリデーションに通る値を仮で入れる
#     first_name: "太郎", 
#     last_name_kana: "ヤマダ", 
#     first_name_kana: "タロウ",
#     address_number:"123-4567",
#     address_prefecture:"北海道",
#     address_name:"横浜市緑区",
#     address_block:"青山1-1-1",
#     address_building:"柳ビル1-1",
#     address_phone_number:"08012345678",
#   )
#   # 仮で作成したインスタンスのバリデーションチェックを行う
#     render '/signup/step3' unless @user.valid?
# end


# def validates_step4
#   # step2で入力された値をsessionに保存
#   session[:card_number] = user_params[:card_number]
#   session[:expiry_date_month] = user_params[:expiry_date_month]
#   session[:expiry_date_year] = user_params[:expiry_date_year]
#   session[:security_code] = user_params[:security_code]
#   # バリデーション用に、仮でインスタンスを作成する
#   @user = User.new(
#     nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
#     email: session[:email],
#     password: session[:password],
#     password_confirmation: session[:password_confirmation],
#     phone_number: session[:phone_number], 
#     last_name: session[:last_name], # 入力前の情報は、バリデーションに通る値を仮で入れる
#     first_name: session[:first_name], 
#     last_name_kana: session[:last_name_kana],
#     first_name_kana: session[:first_name_kana],
#     address_number: session[:address_number],
#     address_prefecture: session[:address_prefecture],
#     address_name: session[:phone_number],
#     address_block: session[:phone_number],
#     address_building: session[:phone_numbersession[:phone_number],
#     address_phone_number:"08012345678",
#     address_phone_number:"08012345678",
#     address_phone_number:"08012345678",
#     address_phone_number:"08012345678",
#   )
#   # 仮で作成したインスタンスのバリデーションチェックを行う
#     render '/signup/step4' unless @user.valid?
# end


  





  def step1
    @user = User.new # 新規インスタンス作成
    # binding.pry
  end

  def step2
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

    @user = User.new # 新規インスタンス作成
    # binding.pry

  end

  def step3
    # step2で入力された値をsessionに保存
    session[:phone_number] = user_params[:phone_number]
    @user = User.new # 新規インスタンス作成
    # binding.pry

  end

  def step4
    # step3で入力された値をsessionに保存
    session[:address_number] = user_params[:address_number]
    session[:address_prefecture] = user_params[:address_prefecture]
    session[:address_name] = user_params[:address_name]
    session[:address_block] = user_params[:address_block]
    session[:address_building] = user_params[:address_building]
    session[:address_phone_number] = user_params[:address_phone_number]
    @user = User.new # 新規インスタンス作成
    # binding.pry

  end


  def create
    # binding.pry

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
      # address_last_name: session[:address_last_name], 
      # address_first_name: session[:address_first_name], 
      # address_last_name_kana: session[:address_last_name_kana], 
      # address_first_name_kana: session[:address_first_name_kana], 
      address_number: session[:address_number], 
      address_prefecture: session[:address_prefecture], 
      address_name: session[:address_name], 
      address_block: session[:address_block], 
      address_building: session[:address_building], 
      address_phone_number: session[:address_phone_number], 
      # introduce: session[:introduce], 
      # encrypted_password: session[:encrypted_password], 
      reset_password_token: session[:reset_password_token], 
      reset_password_sent_at: session[:reset_password_sent_at], 
      remember_created_at: session[:remember_created_at], 
      card_number: user_params[:card_number],
      expiry_date_month: user_params[:expiry_date_month],
      expiry_date_year: user_params[:expiry_date_year],
      security_code: user_params[:security_code],

    )
    if @user.save
# ログインするための情報を保管
      session[:id] = @user.id
      redirect_to done_signup_index_path
    else
      render action: "step1.html.haml"
    end
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
  end
end


def create
  @foo = Foo.new(foo_params)
  if verify_recaptcha(model: @foo, env: Rails.env) && @foo.save
    redirect_to @foo
  else
    render 'new'
  end
end



private
  def user_params
    params.require(:user).permit(
      # params.permit(

      :nickname,
      :email,
      :password,
      :password_confirmation,
      :phone_number,


      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,


      # :birthdate_year,
      # :birthdate_month,
      # :birthdate_day,
      :address_number,
      :address_prefecture,
      :address_name,
      :address_block,
      :address_building,
      :address_phone_number,


      # :address_last_name,
      # :address_first_name,
      # :address_last_name_kana,
      # :address_first_name_kana,
      

      # :introduce,
      # :encrypted_password,

      :card_number,
      :expiry_date_month,
      :expiry_date_year,
      :security_code,
      ## Recoverable
      :reset_password_token,
      :reset_password_sent_at,

      ## Rememberable
      :remember_created_at,
    
      )
  end
