class Api::V1::SpacesController < Api::V1::BaseController
  before_action :find_space, only: %i[show update destroy]

  def index
    @spaces = Space.all
  end

  def show; end

  def create
    @space = Space.new(space_params)
    if @space.save
      render json: @space
    else
      render_error
    end
  end

  def update
    if @space.update(space_params)
      render json: @space
    else
      render_error
    end
  end

  def destroy
    @space.destroy
  end

  def show_user_spaces
    @spaces = Space.where("user_id = #{params[:user_id]}")
  end

  private

  def space_params
    params.require(:space).permit(:title, :category, :price, :image_urls, :city, :address, :description, :user_id)
  end

  def find_space
    @space = Space.find(params[:id])
  end
end
