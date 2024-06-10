Rails.application.routes.draw do
  # The root of the application, this makes it so that the index page within the products view loads first.
  root "products#index"

  # method that maps all conventional routes for a model(collection of data/resources?)
  resources :products
end
