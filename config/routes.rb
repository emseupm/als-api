Rails.application.routes.draw do
  namespace :v1 do
    resources :assembly_line
  end
end
