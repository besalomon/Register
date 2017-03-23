class RoomsController < ApplicationController
  def new
    
  end

  def create
    @department = Room.new(
      name: params[:room_name],
      user_id: current_user.id,
      capacity: params[:capacity]
      )
    if @department.save
      flash[:success] = "Room Created"
      redirect_to "/courses"
    end
  end
end
