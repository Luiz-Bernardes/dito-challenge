class UsersController < ApplicationController
  before_action :set_user, only: [:historic]

  def index
    users = User.all
    @users = TimerDecorator.wrap(users)
  end

  def historic
    points =  Point.where(user_id: params[:id])
    @points = TimerDecorator.wrap(points)
  end
  
  private
    def set_user
      @user = User.find(params[:id])
    end
end
