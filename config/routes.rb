Rails.application.routes.draw do
  resources :contacts do
    resources :phones, only: [:create, :update, :destroy]
    resources :emails, only: [:create, :update, :destroy]
    collection do
      get 'export'
      get 'import'
      post 'proceed'
    end
    member do 
      get 'share'
      post 'sendmail'
    end
  end
  
  root 'contacts#index'
end
