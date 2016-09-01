class ClassRoomsController < ApplicationController
  def index
  	@courses = Course.all.order(:created_at)
  end
end
