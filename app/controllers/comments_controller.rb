class CommentsController < ApplicationController
  def new
    @photo = Photo.find(params[:photo_id])
    comments = Comment.all
    comment = Comment.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    comment = Comment.new(comment_params)
    if comment.save
      ActionCable.server.broadcast 'comment_channel', content: comment
    end
    # render :json => comment
    # redirect_to photo_path(id: params[:photo_id])
  end

  def destroy
    logger.debug("AAAAAAA")
    # binding.pry
    comment = Comment.find_by(id: params[:id], photo_id: params[:photo_id])
    if comment.destroy
      redirect_to photo_path(id: params[:photo_id])
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id,photo_id: params[:photo_id])
  end
end
