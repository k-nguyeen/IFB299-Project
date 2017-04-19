Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :pages do
  collection do
    get :login
	get :about
  get :account
  get :results
  get :dwelling
  end
end


end
