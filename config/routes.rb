Rails.application.routes.draw do
  get '/' => 'contacts#index'
  get '/all_contacts' => 'contacts#index'
  get '/all_contacts/new' => 'contacts#new'
  post '/all_contacts' => 'contacts#create'
  get '/all_contacts/:id' => 'contacts#show'
  get '/all_contacts/:id/edit' => 'contacts#edit'
  patch '/all_contacts/:id' => 'contacts#update'
  delete '/all_contacts/:id' => 'contacts#destroy'
end
