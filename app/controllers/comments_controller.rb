class CommentsController < ApplicationController
  # setup for deployment:
  before_action :authenticate_user!, only: [:create]


  def create
    @gram = Gram.find_by_id(params[:gram_id])
    return render_not_found if @gram.blank?


    @gram.comments.create(comment_params.merge(user: current_user))
    redirect_to root_path
  end

  private

  # def render_not_found(status=:not_found)
  #   render plain: "#{status.to_s.titleize} :(", status: status
  # end
  # Add the method to app/controllers/application_controller.rb, so all the controllers in the application can use the method:

  def comment_params
    params.require(:comment).permit(:message)
  end


end
