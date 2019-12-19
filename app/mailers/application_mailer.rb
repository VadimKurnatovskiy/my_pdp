class ApplicationMailer < ActionMailer::Base
  def feedback(feedback)
    @feedback = feedback
    mail(from: feedback[:email], to: ENV.fetch("FEEDBACK_EMAIL"))
  end
end
