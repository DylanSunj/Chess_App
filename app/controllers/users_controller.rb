class UsersController < ApplicationController
  def index
    render({ :template => "users/index"})
  end

  def update
    the_id = params.fetch("path_id")
    the_user = User.where({ :id => the_id }).at(0)

    the_user.name = params.fetch("query_name")
    the_user.rating = params.fetch("query_rating").to_i
    the_user.bio = params.fetch("query_bio")

    if the_user.valid?
      the_user.save
      redirect_to("/users/#{current_user.id}", { :notice => "User profile updated successfully."} )
    else
      redirect_to("/users/#{current_user.id}", { :alert => the_user.errors.full_messages.to_sentence })
    end
  end
end
