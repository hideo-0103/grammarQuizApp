Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'quizzes#index'
  resources :quizzes do
      collection do 
        get 'lang'
    end
  end
  resources :users do
    member do
      get :challenge
    end
    
  end
end
