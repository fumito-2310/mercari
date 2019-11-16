class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable,omniauth_providers: [:facebook, :google_oauth2]

  has_many :sns_credentials, dependent: :destroy
  # ユーザは複数のコメントが可能　澤木
  has_many :comments


         VALID_EMAIL_REGEX =                 /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

         # step1入力項目
         validates :nickname,                presence: true, length: {maximum: 20}
         validates :email,                   presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
         validates :password,                presence: true, length: {minimum: 6, maximum: 128}
         validates :password_confirmation,   presence: true, length: {minimum: 6, maximum: 128}
         validates :last_name,               presence: true
         validates :first_name,              presence: true
         validates :last_name_kana,          presence: true
         validates :first_name_kana,         presence: true

         validates :birthdate_year,          presence: true
         validates :birthdate_month,         presence: true
         validates :birthdate_day,           presence: true


         validates :phone_number,            presence: true


         # step3入力項目
      
         validates :address_number,          presence: true
         validates :address_prefecture,      presence: true
         validates :address_name,            presence: true
         validates :address_block,           presence: true
        #  validates :address_building,        presence: true
        #  validates :address_phone_number,    presence: true


         validates :card_number,             presence: true
         validates :expiry_date_month,       presence: true
         validates :expiry_date_year,        presence: true
         validates :security_code,           presence: true


        







  #  SNSログイン機能。facebookかgoogleからユーザー情報を引っ張り出してreturnする。
  #       このときSNScredentialsテーブルにはuidとproviderを保存するが、User情報は保存しない。
        def self.find_oauth(auth)
          uid = auth.uid
          provider = auth.provider
          snscredential = SnsCredential.where(uid: uid, provider: provider).first
          if snscredential.present? #sns登録のみ完了してるユーザー
            user = User.where(id: snscredential.user_id).first
            unless user.present? #ユーザーが存在しないなら
              user = User.new(
                nickname: auth.info.name,
                email: auth.info.email,
              )
            end
            sns = snscredential
          else #sns登録 未
            user = User.where(email: auth.info.email).first
          if user.present? #会員登録 済
            else #会員登録 未
              user = User.new(
                nickname: auth.info.name,
                email: auth.info.email,
              )
              sns = SnsCredential.new(
                uid: uid,
                provider: provider,
              )
            end
          end
          return {  user: user , sns: sns } # hashでsnsのidを返り値として保持しておく
        end








       


         has_many :cards

  # has_many :bought_items, foreign_key: "buyer_id", class_name: "Item"
  # has_many :selling_items, -> { where("buyer_id is NULL") }, foreign_key: "seller_id", class_name: "Item"
  # has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id", class_name: "Item"
       
       
end
