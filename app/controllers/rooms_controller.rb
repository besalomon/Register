class RoomsController < ApplicationController
  def new
    
  end

  def create
    @room = Room.new(
      name: params[:room_name],
      user_id: current_user.id,
      capacity: params[:capacity]
      )
    if @room.save
      flash[:success] = "Room Created"
      redirect_to "/courses"
    end
  end

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find_by(id: params[:id])
  end

  def update
    @room = Room.find_by(id: params[:id])
    @room.update(
      name: params[:room_name],
      capacity: params[:capacity]
      )
    redirect_to "/rooms"
  end

  def destroy
    room = Room.find_by(id:params[:id])
    room.delete
    course_room = CourseRoom.find_by(room_id: room.id)
    if course_room
      course_room.delete
    end
    redirect_to "/rooms"
  end
end
