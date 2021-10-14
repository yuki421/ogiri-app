class PhotosController < ApplicationController
  before_action :find_params, except: [:index, :new, :create]
  before_action :authenticate_user!, only: [:new, :edit]


  def index
    @photos = Photo.order(created_at: :desc)
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(post_params)
    if @photo.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @photo.comments.includes(:user)
  end

  def edit
  end

  def update
    if @photo.update(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @photo.destroy
      redirect_to root_path
    end
  end

  private

  def find_params
    @photo = Photo.find(params[:id])
  end

  def post_params
    params.require(:photo).permit(:image, :title, :category_id).merge(user_id: current_user.id)
  end

end
