class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :pay, :purchase]

  def index
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to root_path
    
    # if @item.save
    #   redirect_to root_path, notice: '商品を登録しました'
    # else
    #   # render :new
    # end

  end

  def new
    @item = Item.new
    @category_parents = Category.all.where(ancestry: nil)
    # gon.item = @item
    # gon.images = @item.images

    # # @item.item_imagse.image_urlをバイナリーデータにしてビューで表示できるようにする
    # require 'base64'
    # # require 'aws-sdk'

    # gon.images_binary_datas = []
    # if Rails.env.production?
    #   client = Aws::S3::Client.new(
    #                          region: 'ap-northeast-1',
    #                          access_key_id: Rails.application.credentials.aws[:access_key_id],
    #                          secret_access_key: Rails.application.credentials.aws[:secret_access_key],
    #                          )
    #   @item.images.each do |image|
    #     binary_data = client.get_object(bucket: 'freemarket-sample-51a', key: image.image_url.file.path).body.read
    #     gon.images_binary_datas << Base64.strict_encode64(binary_data)
    #   end
    # else
    #   @item.images.each do |image|
    #     binary_data = File.read(image.image_url.file.file)
    #     gon.images_binary_datas << Base64.strict_encode64(binary_data)
    #   end
    # end
  end

  def edit
  end

  def show
    @comments = @item.comments.includes(:user)
    @user = User.find(@item.seller_id)
  end

  def update
  end

  def destroy
  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(id: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
#選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  # def search
  #   respond_to do |format|
  #     format.html
  #     format.json do
  #      @children = Category.find(params[:parent_id]).children
  #     end
  #   end
  # end

  def purchase
    card = current_user.card
    #テーブルからpayjpの顧客IDを検索
    @user = User.find(@item.seller_id)
    unless @item.seller_id == @item.buyer_id
      redirect_to root_path
    else
    end

    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card["customer_id"])
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
      @card_brand = @default_card_information.brand
      @card_src = "Visa.png"
    end
  end

  def pay
    card = current_user.card
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    amount: @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
    customer: card.customer_id, #顧客ID
    currency: 'jpy' #日本円
    )
    @item.update(buyer_id: current_user.id)
    redirect_to action: 'done'
  end

  def done
  end

  private

  def item_params
    params.require(:item).permit(:image,
                                 :name,
                                 :explanation,
                                 :details_size,
                                 :details_state,
                                 :delivery_fee,
                                 :delivery_area,
                                 :delivery_days,
                                 :price)
                                 .merge(seller_id: 1)
                                 .merge(buyer_id: 1)
                                 .merge(details_category_major: "ダミー")
                                 .merge(details_category_medium: "ダミー")
                                 .merge(details_category_minor: "ダミー")
  end

  def set_item
    @item = Item.find(params[:id])
  end

  # def registered_image_params
  #   params.require(:registered_images_ids).permit({ids: []})
  # end

  # def new_image_params
  #   params.require(:new_images).permit({images: []})
  # end


end
