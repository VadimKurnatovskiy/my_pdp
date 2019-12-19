FactoryGirl.create(:user, email: "user@example.com")
FactoryGirl.create(:user, email: "user2@example.com")

FactoryGirl.create_list(:article, 12, user_id: 1)
