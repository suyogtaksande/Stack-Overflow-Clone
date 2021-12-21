Rails.application.routes.draw do
  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'

      get 'likes/create'
      delete 'likes/destroy'
      get 'questions/user_questions'

      resources :questions, only: [:create, :update, :show, :index] do
        get 'answers/create'
        put 'answers/accept_answer/:id' => 'answers#accept_answer'
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
