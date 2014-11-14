Rails.application.routes.draw do
  resources :services, shallow: true do
    resources :jobs
  end
end
