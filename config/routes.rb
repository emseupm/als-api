Rails.application.routes.draw do
  namespace :v1 do
    resources :assembly_lines do
      resources :stations
    end
  	resources :inventories
  	get '/inventories/:id/upStock', to: 'inventories#add_stock'
  	get '/inventories/:id/downStock', to: 'inventories#remove_stock'
  end
end
