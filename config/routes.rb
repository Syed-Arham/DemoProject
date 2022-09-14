Rails.application.routes.draw do
   devise_for :employees
   root 'users#index'
   resources :users do
    resources :loans
    resources :salaries, except: [:edit, :update] do
      resources :additional_earnings
      resources :additional_deductions
   end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
