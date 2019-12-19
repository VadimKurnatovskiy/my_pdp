require "rails_helper"

include ActiveJob::TestHelper

feature "Create Feedback" do
  let(:feedback_attributes) { attributes_for(:feedback) }

  before do
    ActiveJob::Base.queue_adapter = :test
  end

  scenario "Visitor creates feedback" do
    visit new_feedback_path

    fill_form :feedback, feedback_attributes

    perform_enqueued_jobs do
      click_button "Submit"
    end

    open_email(ENV.fetch("FEEDBACK_EMAIL"))

    expect(current_email).to have_subject("Feedback")
    expect(current_email).to be_delivered_from(feedback_attributes[:email])

    expect(current_email).to have_body_text(feedback_attributes[:email])
    expect(current_email).to have_body_text(feedback_attributes[:phone])
    expect(current_email).to have_body_text(feedback_attributes[:email])
    expect(current_email).to have_body_text(feedback_attributes[:message])

    expect(page).to have_content("Feedback was successfully sent.")
  end
end
