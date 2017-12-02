class PostImagesController < ApplicationController

	def new
		@post_image = Post_Images.new
	end

	def create
		@post_image = Post_Images.new(post_image_params)
    	@post_image.user_id = current_user.id
    	@post_image.save
    	redirect_to user_path(user)
	end



	def index
	end

	def show
		@post = Post_Images.find_by(id: params[:id])
	end

	private
    def post_image_params
        params.require(:post_image).permit(:shop_name, :image, :caption, :user_id)
    end

end
