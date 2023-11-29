Rails.application.routes.draw do
  # Routes for the Attendee resource:
  devise_for :users
  root "events#index"

  # CREATE
  post("/insert_attendee", { :controller => "attendees", :action => "create" })
          
  # READ
  get("/attendees", { :controller => "attendees", :action => "index" })
  
  get("/attendees/:path_id", { :controller => "attendees", :action => "show" })
  
  # UPDATE
  
  post("/modify_attendee/:path_id", { :controller => "attendees", :action => "update" })
  
  # DELETE
  get("/delete_attendee/:path_id", { :controller => "attendees", :action => "destroy" })

  #------------------------------

  # Routes for the Event resource:

  # CREATE
  post("/insert_event", { :controller => "events", :action => "create" })
          
  # READ
  get("/events", { :controller => "events", :action => "index" })
  
  get("/events/:path_id", { :controller => "events", :action => "show" })
  
  # UPDATE
  
  post("/modify_event/:path_id", { :controller => "events", :action => "update" })
  
  # DELETE
  get("/delete_event/:path_id", { :controller => "events", :action => "destroy" })

  #------------------------------

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
