class MeetingsController < ApplicationController
  # respond_to :json
  def index
    @meetings = Meeting.not_cancelled
    # respond_with @meetings
  end

  def create
    @meeting = current_user.mentee_meetings.build(params[:meeting])
    logger.debug(@meeting.inspect)
    respond_to do |format|
      if @meeting.save
        format.js
      else
        render 'index'
      end
    end
  end

  def update
    @meeting = Meeting.find(params[:id])
    @meeting.update_attribute(:status, params[:status])
  end
end