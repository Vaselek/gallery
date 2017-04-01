class ImagesController < InheritedResources::Base

  private

    def image_params
      params.require(:image).permit(:title, :user_id)
    end
end

