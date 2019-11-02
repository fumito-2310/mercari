class ItemsController < ApplicationController

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
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:image,
                                 :name,
                                 :explanation,
                                 :details_category_major,
                                 :details_category_medium,
                                 :details_category_minor,
                                 :details_size,
                                 :details_state,
                                 :delivery_fee,
                                 :delivery_area,
                                 :delivery_days,
                                 :price)
                                 .merge(seller_id: 1)
  end

end
