class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    
    binding.pry

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
    @item = Item.find(params[:id])
    @comments = @item.comments.includes(:user)
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

  # def registered_image_params
  #   params.require(:registered_images_ids).permit({ids: []})
  # end

  # def new_image_params
  #   params.require(:new_images).permit({images: []})
  # end


end
