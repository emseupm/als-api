Rails.application.routes.draw do
  namespace :v1 do
    resources :assembly_lines do
      resources :stations
    end
  end
end
