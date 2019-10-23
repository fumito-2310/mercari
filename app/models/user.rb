class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         VALID_EMAIL_REGEX =                 /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

         # step1入力項目
         validates :nickname,                presence: true, length: {maximum: 20}
         validates :email,                   presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
         validates :password,                presence: true, length: {minimum: 6, maximum: 128},on: :save_to_session_before_phone
         validates :password_confirmation,   presence: true, length: {minimum: 6, maximum: 128},on: :save_to_session_before_phone
       

         validates :phone_number,            presence: true


         # step3入力項目
         validates :last_name,               presence: true
         validates :first_name,              presence: true
         validates :last_name_kana,          presence: true
         validates :first_name_kana,         presence: true
         validates :address_number,          presence: true
         validates :address_prefecture,      presence: true
         validates :address_name,            presence: true
         validates :address_block,           presence: true
         validates :address_building,        presence: true
         validates :address_phone_number,    presence: true


         validates :card_number,             presence: true
         validates :expiry_date_month,       presence: true
         validates :expiry_date_year,        presence: true
         validates :security_code,           presence: true


end
