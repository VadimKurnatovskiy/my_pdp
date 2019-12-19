class FeedbacksController < ApplicationController
  expose(:feedback)

  def new
  end

  def create
    ApplicationMailer.feedback(feedback.serializable_hash).deliver_later! if feedback.save
    respond_with(feedback, location: root_path)
  end

  private

  def feedback_params
    params.require(:feedback).permit(:email, :name, :message, :phone)
  end
end
