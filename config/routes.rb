Rails.application.routes.draw do

  resources :report_lines
  resources :monthly_reports do
    collection do
      post :import
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
