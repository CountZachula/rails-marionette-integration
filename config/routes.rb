Rails.application.routes.draw do
  root 'weather#index'

  resources :weather, only: [:index]
	get 'conditions', to: 'weather#conditions'

end
