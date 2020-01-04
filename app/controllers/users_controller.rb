class UsersController < ApplicationController
 def show
  @nickname = current_user.nickname
  @items = Item.where(seller_id: current_user.id)
 end

 def edit
 end

 def identification
  @last_name = current_user.last_name
  @first_name = current_user.first_name
 end

 def new
    @user = current_user.id
    @user.create(user_params)
   else
 end

 def profile
  @nickname = current_user.nickname
 end
 def logout
 end

 private

 def user_params
 params.permit(:address_number,:address_prefecture,:address_name,:address_block,:address_building)
 end
end
