class FeedbacksController < ApplicationController
  def index
  end

  def create
    feedback = Feedback.new(
      sender_name: params[:sender_name],
      sender_email: params[:sender_email],
      comment: params[:comment])

    if feedback.save
      redirect_to feedbacks_path, notice: "We heard you voice. We appreciate your feedback."
    end
  end

end
