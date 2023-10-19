class UsersController < ApplicationController
  def index; end
end
def destroy
    sign_out(current_user)
    redirect_to new_user_session_path
  end