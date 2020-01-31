require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "comments#create action" do
    it "should allow users to create comments on grams" do
      # Create gram in db, direct server response for User to root_path via redirect, & ensure single comment created w/ message relayed.
      gram = FactoryBot.create(:gram)

      user = FactoryBot.create(:user)
      sign_in user
      post :create, params: { gram_id: gram.id, comment: { message: 'awesome gram' } }

      expect(response).to redirect_to root_path
      expect(gram.comments.length).to eq 1
      expect(gram.comments.first.message).to eq "awesome gram"
    end

    it "should require a user to be logged in to comment on a gram" do
      #  require users to be logged in when they create a comment.
      # use FactoryBot to create gram in db
      gram = FactoryBot.create(:gram)
      post :create, params: { gram_id: gram.id, comment: { message: 'awesome gram' } }
      expect(response).to redirect_to new_user_session_path
    end

    it "should return http status code of not found if the gram isn't found" do
      #  scenario: If a user tries to create a comment for a gram that doesn't exist, they will recieve a 404 Not Found error message.
      user = FactoryBot.create(:user)
      sign_in user
      post :create, params: { gram_id: 'YOLOSWAG', comment: { message: 'awesome gram' } }
      expect(response).to have_http_status :not_found
    end
  end
end
