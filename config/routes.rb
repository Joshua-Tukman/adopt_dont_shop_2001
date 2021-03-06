Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: "welcome#index"
  get '/shelters', to: "shelters#index"
  get '/shelters/new', to: "shelters#new"
  post '/shelters', to: "shelters#create"
  get '/shelters/:id', to: "shelters#show"
  get '/shelters/:id/edit', to: "shelters#edit"
  put '/shelters/:id', to: "shelters#update"
  delete '/shelters/:id', to: "shelters#destroy"

  get '/pets', to: "pets#index"
  get '/pets/:id', to: "pets#show"
  get '/pets/:id/edit', to: "pets#edit"
  put '/pets/:id', to: "pets#update"
  delete 'pets/:id', to: "pets#destroy"

  get '/shelters/:shelter_id/pets', to: "shelter_pets#index"
  get '/shelters/:shelter_id/pets/new', to: "shelter_pets#new"
  post '/shelters/:shelter_id/pets', to: "shelter_pets#create"
  delete '/shelters/:shelter_id/pets/:pet_id', to: "shelter_pets#destroy"


end
