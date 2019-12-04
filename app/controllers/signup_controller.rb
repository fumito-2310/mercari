class SignupController < ApplicationController


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
  end

  def step3
    # step2で入力された値をsessionに保存
    session[:phone_number] = user_params[:phone_number]
    @user = User.new # 新規インスタンス作成
    

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
    

  end


  def create
    # if session[:uid].present? && session[:provider].present?
    #   password = Devise.friendly_token.first(7)


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
      provider: session[:provider],
      uid: session[:uid]
    )
    

    # @sns = SnsCredential.create(
    #   uid: session[:uid],
    #   provider: session[:provider],
    #   user_id: @user.id
    # )






    if @user.save
      # @sns = SnsCredential.where(uid: @user.uid)
      # if @sns
      #     @sns.update(user_id: @user.id)
      # end
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


# def create
#   @foo = Foo.new(foo_params)
#   if verify_recaptcha(model: @foo, env: Rails.env) && @foo.save
#     redirect_to @foo
#   else
#     render 'new'
#   end
# end



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


      :birthdate_year,
      :birthdate_month,
      :birthdate_day,
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
      :provider,
      :uid,

      ## Recoverable
      :reset_password_token,
      :reset_password_sent_at,

      ## Rememberable
      :remember_created_at,
    
      )
  end
