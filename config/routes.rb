Rails.application.routes.draw do
  # Routes for the Events consumer resource:

  # CREATE
  post("/insert_events_consumer", { :controller => "events_consumers", :action => "create" })
          
  # READ
  get("/events_consumers", { :controller => "events_consumers", :action => "index" })
  
  get("/events_consumers/:path_id", { :controller => "events_consumers", :action => "show" })
  
  # UPDATE
  
  post("/modify_events_consumer/:path_id", { :controller => "events_consumers", :action => "update" })
  
  # DELETE
  get("/delete_events_consumer/:path_id", { :controller => "events_consumers", :action => "destroy" })

  #------------------------------

  # Routes for the Events promoter resource:

  # CREATE
  post("/insert_events_promoter", { :controller => "events_promoters", :action => "create" })
          
  # READ
  get("/events_promoters", { :controller => "events_promoters", :action => "index" })
  
  get("/events_promoters/:path_id", { :controller => "events_promoters", :action => "show" })
  
  # UPDATE
  
  post("/modify_events_promoter/:path_id", { :controller => "events_promoters", :action => "update" })
  
  # DELETE
  get("/delete_events_promoter/:path_id", { :controller => "events_promoters", :action => "destroy" })

  #------------------------------

  # Routes for the Order resource:

  # CREATE
  post("/insert_order", { :controller => "orders", :action => "create" })
          
  # READ
  get("/orders", { :controller => "orders", :action => "index" })
  
  get("/orders/:path_id", { :controller => "orders", :action => "show" })
  
  # UPDATE
  
  post("/modify_order/:path_id", { :controller => "orders", :action => "update" })
  
  # DELETE
  get("/delete_order/:path_id", { :controller => "orders", :action => "destroy" })

  #------------------------------

  devise_for :table_people
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

  devise_for :venues
  devise_for :promoters
  devise_for :consumers

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
  
end
