class CommentsController < ApplicationController
  def create
    # user_idは仮置き。本来はcurrent_user.id
    comment = Comment.create(text: comment_params[:text], item_id: comment_params[:item_id], user_id: current_user.id)
    redirect_to "/items/#{comment.item.id}"
  end

  private
  def comment_params
    params.permit(:text, :item_id)
  end
end
