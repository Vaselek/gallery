class CommentariesController < InheritedResources::Base

  def destroy
    @commentary = current_user.commentaries.find(params[:id])
    @commentary.destroy
    flash[:success] = "Comment deleted!"

    redirect_to :back
  end

  def create
    @image = Image.find(params[:image_id])
    @commentary = @image.commentaries.build(commentary_params)
    @commentary.user = current_user

    if @commentary.save
      respond_to do |format|
        format.html { redirect_to :back }
        format.js {}
      end
    else
      flash[:alert] = "Something is wrong!"
      render 'users#show'
    end

  end

  private

  def commentary_params
    params.require(:commentary).permit(:user_id, :image_id, :grade, :content)
  end
end

