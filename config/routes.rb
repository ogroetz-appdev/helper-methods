Rails.application.routes.draw do
  # get("/",  controller: => "movies", action: => "index" )
  # get "/" => "movies#index"
  root "movies#index"
  # Routes for the Movie resource:

  # CREATE
  post "/movies" => "movies#create", as: :movies
  get "/movies/new" => "movies#new", as: :new_movie
          
  # READ
  get "/movies" => "movies#index"
  # get "/movies/:id" => "movies#show", as: :details
  get "/movies/:id" => "movies#show", as: :movie # movie() ===> expects an arg to populate :id segment
  
  # UPDATE
  patch "/movies/:id" => "movies#update"
  get "/movies/:id/edit" => "movies#edit", as: :edit_movie # edit_movie() ===> expects an arg to populate :id segment
  
  # DELETE
  delete "/movies/:id" => "movies#destroy"

  #------------------------------
end
