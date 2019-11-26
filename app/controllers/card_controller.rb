class CardController < ApplicationController

    #   require "payjp"
    
    #   def pay #クレジットカード登録
    #     Payjp.api_key = "PAYJP_PRIVATE_KEY"
    #     # ここでテスト鍵をセットしてあげる(環境変数にしても良い)
    #     if params['payjpToken'].blank?
    #     # paramsの中にjsで作った'payjpTokenが存在するか確かめる
    #       redirect_to action: "new"
    #     else
    #       customer = Payjp::Customer.create(
    #       card: params['payjpToken'],
    #       metadata: {user_id: current_user.id}
    #       )
    #      # ↑ここでjay.jpに保存
    #       @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
    #      # ここでdbに保存
    #       if @card.save
    #         redirect_to action: "show"
    #         flash[:notice] = 'クレジットカードの登録が完了しました'
    #       else
    #         redirect_to action: "pay"
    #         flash[:alert] = 'クレジットカード登録に失敗しました'
    #       end
    #     end
    #  end
      # def new
      #   card = Card.where(user_id: current_user.id)
      #   redirect_to action: "show" if card.exists?
      # end
    
      # def pay #payjpとCardのデータベース作成を実施します。
        
      #   Payjp.api_key = Rails.application.credentials.PAYJP_PRIVATE_KEY
      #   if params['payjp-token'].blank?
      #     redirect_to action: "new"
      #   else
      #     customer = Payjp::Customer.create(
      #     card: params['payjp-token'],)
      #     @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id:customer.default_card)
      #     if @card.save
      #       redirect_to purchase_path(session[:product_id])
      #     else
      #       redirect_to action: "pay"
      #     end
      #   end
      # end
    
    
    #   def show #Cardのデータpayjpに送り情報を取り出します
    #     card = Card.where(user_id: current_user.id).first
    #     if card.blank?
    #       redirect_to action: "new" 
    #     else
    #       Payjp.api_key = Rails.application.credentials.PAYJP_PRIVATE_KEY
    #       customer = Payjp::Customer.retrieve(card.customer_id)
    #       @default_card_information = customer.cards.retrieve(card.card_id)
    #     end
    #   end
    
    #   private
    
    #   def set_card
    #     @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
    #   end
    # end
    
    
    
    
    
      #   require "payjp"
    #   before_action :set_card
    
    #   def new # カードの登録画面。送信ボタンを押すとcreateアクションへ。
    #     session[:address_number] = user_params[:address_number]
    #     session[:address_prefecture] = user_params[:address_prefecture]
    #     session[:address_name] = user_params[:address_name]
    #     session[:address_block] = user_params[:address_block]
    #     session[:address_building] = user_params[:address_building]
    #     session[:address_phone_number] = user_params[:address_phone_number]
    #     @user = User.new
    
    #     card = Card.where(user_id: current_user.id).first
    #     redirect_to action: "index" if card.present?
    #   end
    
    #  # indexアクションはここでは省略
    
    #   def create #PayjpとCardのデータベースを作成
    #     # Payjp.api_key = '秘密鍵'
    #     # Payjp.api_key = 'PAYJP_PRIVATE_KEY'
    #     Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    
    #     if params['payjp-token'].blank?
    #       redirect_to action: "new"
    #     else
    #       # トークンが正常に発行されていたら、顧客情報をPAY.JPに登録します。
    #       customer = Payjp::Customer.create(
    #         description: 'test', # 無くてもOK。PAY.JPの顧客情報に表示する概要です。
    #         email: current_user.email,
    #         card: params['payjp-token'], # 直前のnewアクションで発行され、送られてくるトークンをここで顧客に紐付けて永久保存します。
    #         metadata: {user_id: current_user.id} # 無くてもOK。
    #       )
    #       @user = User.new(session[:user_params])
    #       # @user.build_profile(session[:profile_attributes_after_delivery])
    #       if @user.save
    #         @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
    #         session[:id] = @user.id
    #         redirect_to done_signup_index_path
    #       else
    #         render 'card#new'
    #       end
    #     end
    #   end
    
    #   private
    
    #   def set_card
    #     @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
    #   end
    # end
    
    
    require "payjp"
    
    def new
      card = Card.where(session[:email])

      # card = Card.where(user_id: current_user.id)
      # redirect_to action: "show" if card.exists?
    end

    
    def pay #payjpとCardのデータベース作成を実施します。
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      # Payjp.api_key = 'PAYJP_PRIVATE_KEY'    
      if params['payjp-token'].blank?
        redirect_to action: "new"
      else
        binding.pry

        customer = Payjp::Customer.create(
        description: '登録テスト', #なくてもOK
        email: current_user.email, #なくてもOK
        card: params['payjp-Token'],
        metadata: {user_id: current_user.id}
        ) #念の為metadataにuser_idを入れましたがなくてもOK
        @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
        if @card.save
          binding.pry
          redirect_to done_signup_index_path
      else
          redirect_to action: "pay"
        end
      end
    end
    
    def delete #PayjpとCardデータベースを削除します
      card = Card.where(user_id: current_user.id).first
      if card.blank?
      else
        Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
        customer = Payjp::Customer.retrieve(card.customer_id)
        customer.delete
        card.delete
      end
        redirect_to action: "new"
    end
    
    def show #Cardのデータpayjpに送り情報を取り出します
      card = Card.where(user_id: current_user.id).first
      if card.blank?
        redirect_to action: "new" 
      else
        Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
        customer = Payjp::Customer.retrieve(card.customer_id)
        @default_card_information = customer.cards.retrieve(card.card_id)
      end
    end
    end
