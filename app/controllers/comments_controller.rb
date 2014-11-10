class CommentsController < ApplicationController
  def create
    commentable = params[:comment][:commentable_type].constantize.find(params[:comment][:commentable_id])
    if user_signed_in? || verify_recaptcha
      comment = Comment.new comment_params
      comment.commentable = commentable
      comment.user = current_user
      comment.save
    end

    redirect_to commentable
  end

  private
  def comment_params
    params.require(:comment).permit!
  end
end
