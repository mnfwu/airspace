class UserController < Api::V1::BaseController
  def find_user
    @user = User.find(params[:id])
  end
end
