class Api::V1::SpacesController < Api::V1::BaseController
	before_action :find_space, only: [:show, :update, :destroy]

	def index
		@spaces = Space.all
	end

	def show
	end

	def create
		@space = Space.new(space_params)
		@space.save
		if @space.save
			render :show, status: :created
		else
			render_error
		end
	end

	def update
		if @space.update(space_params)
			render :show
		else 
			render_error
		end
	end

	def destroy
		@space.destroy
	end

	def show_spaces
		@spaces = Space.where("user_id LIKE '#{params[:user_id]}'")
	end

	private 

	def space_params
		params.require(:space).permit(:title, :category, :price, :image_urls, :city, :address, :description, :user_id)
	end

	def find_space
		@space = Space.find(params[:id])
	end

end