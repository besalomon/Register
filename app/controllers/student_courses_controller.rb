class StudentCoursesController < ApplicationController
  def destroy
    @record = StudentCourse.find_by("student_id =? AND course_id =?", current_user.student.id, params[:id])
    if @record
      if @record.status_id == 2
      @record.delete
      else
        flash[:warning] = "You can't cancel registration, since the teacher has already evaluated your record"
      end
    end
    flash[:success] = "You were successfully removed from the course #{@record.course.name}"
    redirect_to "/dashboard"
  end
end
  