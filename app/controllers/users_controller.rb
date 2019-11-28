class UsersController < ApplicationController
 def show
  @nickname = current_user.nickname
  @items = Item.where(seller_id: current_user.id)
 end

  def edit
  end

 def new
    @user = current_user.id
    @user.create(user_params)
   else
 end

 private

 def user_params
 params.permit(:address_number,:address_prefecture,:address_name,:address_block,:address_building)
 end
end
