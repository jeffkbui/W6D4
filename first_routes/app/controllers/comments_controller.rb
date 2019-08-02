class CommentsController < ApplicationController
  def index
    if params.has_key?(:user_id)
      comment = Comment.where(user_id: params[:user_id])
    elsif params.has_key?(:artwork_id)
      comment = Comment.where(artwork_id: params[:artwork_id])
    else
      comment = Comment.all
    end
    render json: comment
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save!
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end
  def destroy
    comment = Comment.find(params[:id])
    comment.delete
    render json: comment
  end
  private
  def comment_params
    params.require(:comment).permit(:body, :user_id, :artwork_id)
  end
end
