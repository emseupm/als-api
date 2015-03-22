Rails.application.routes.draw do
  namespace :v1 do
    resources :assembly_lines do
      resources :stations
      resources :simulations
    end

  	resources :inventories do
      member do
  	    get '/upStock', to: 'inventories#add_stock'
  	    get '/downStock', to: 'inventories#remove_stock'
      end
    end
  end
end
