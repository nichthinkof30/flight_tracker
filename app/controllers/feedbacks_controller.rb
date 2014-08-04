class FeedbacksController < ApplicationController
  def index
    @feedback = Feedback.new
  end

  def create
    feedback = Feedback.new(feedback_params)

    if feedback.save
      redirect_to feedbacks_path, notice: "We heard your voice. We appreciate your feedback."
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:sender_name, :sender_email, :comment)
  end

end
