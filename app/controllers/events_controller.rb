class EventsController < ApplicationController
  def index
    matching_events = Event.all

    @list_of_events = matching_events.order({ :created_at => :desc })

    render({ :template => "events/index" })
  end

  def show

    the_id = params.fetch("path_id")

    if Event.where({ :id => the_id}).first != nil 
      matching_events = Event.where({ :id => the_id })

      @the_event = matching_events.at(0)
      
      @attendees_count = Attendee.where(event: @the_event.id).count

      render({ :template => "events/show" })
    else
      redirect_to("/events", { :alert => "That event does not exist!" })
    end

  end

  def add
    render({ :template => "events/add"})
  end

  def create
    the_event = Event.new
    the_event.people = current_user.id
    the_event.location = params.fetch("query_location")
    the_event.date = params.fetch("query_date")
    the_event.description = params.fetch("query_description")
    
    if the_event.valid?
      the_event.save
      redirect_to("/", { :notice => "Event created successfully." })
    else
      redirect_to("/events", { :alert => the_event.errors.full_messages.to_sentence })
    end
  end

  def change 
    the_id = params.fetch("path_id")

    matching_events = Event.where({ :id => the_id })

    @the_event = matching_events.at(0)
    
    @attendees_count = Attendee.where(event: @the_event.id).count

    render({ :template => "events/change"})
  end 

  def update
    the_id = params.fetch("path_id")
    the_event = Event.where({ :id => the_id }).at(0)

    the_event.location = params.fetch("query_location")
    the_event.date = params.fetch("query_date")
    the_event.description = params.fetch("query_description")


    if the_event.valid?
      the_event.save
      redirect_to("/users/#{current_user.id}", { :notice => "Event updated successfully."} )
    else
      redirect_to("/events/#{the_event.id}", { :alert => the_event.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")

    the_event = Event.where({ :id => the_id }).at(0)

    participants = Attendee.where(event: the_id)

    participants.each do |participant|
      participant.destroy
    end 

    the_event.destroy

    redirect_to("/events", { :notice => "Event deleted successfully."} )
  end
end
