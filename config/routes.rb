Rails.application.routes.draw do
  resources :books
  scope "/:locale" do
    resources :books
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
