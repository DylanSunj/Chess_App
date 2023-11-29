class AttendeesController < ApplicationController
  def index
    matching_attendees = Attendee.all

    @list_of_attendees = matching_attendees.order({ :created_at => :desc })

    render({ :template => "attendees/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_attendees = Attendee.where({ :id => the_id })

    @the_attendee = matching_attendees.at(0)

    render({ :template => "attendees/show" })
  end

  def create
    the_attendee = Attendee.new
    the_attendee.user = params.fetch("query_user")
    the_attendee.event = params.fetch("query_event")

    if the_attendee.valid?
      the_attendee.save
      redirect_to("/attendees", { :notice => "Attendee created successfully." })
    else
      redirect_to("/attendees", { :alert => the_attendee.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_attendee = Attendee.where({ :id => the_id }).at(0)

    the_attendee.user = params.fetch("query_user")
    the_attendee.event = params.fetch("query_event")

    if the_attendee.valid?
      the_attendee.save
      redirect_to("/attendees/#{the_attendee.id}", { :notice => "Attendee updated successfully."} )
    else
      redirect_to("/attendees/#{the_attendee.id}", { :alert => the_attendee.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_attendee = Attendee.where({ :id => the_id }).at(0)

    the_attendee.destroy

    redirect_to("/attendees", { :notice => "Attendee deleted successfully."} )
  end
end
