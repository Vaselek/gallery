class ImagesController < InheritedResources::Base

  def new
    @image = Image.new
  end

  def create
    @user = current_user
    @image = @user.images.create(image_params)
    if @image.save
      flash[:success] = "Image created!"
      redirect_to root_url
    else
      redirect_to :back
    end
  end

  def show
    @commentary = Commentary.new
    @image = Image.find(params[:id])
    @image_commentaries = @image.commentaries.order(created_at: :desc)
  end

  def index
    @images = Image.all.order(created_at: :desc).paginate(:page => params[:page])
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:success] = "Image deleted!"

    redirect_to :back
  end

  private

    def image_params
      params.require(:image).permit(:title, :user_id, :file)
    end

end

