Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :inquiries, only: [:index, :show] do
    # resource :form_submission_settings, only: [:edit, :update]
      member do
        get :complete
      end
    end
  end
  post '/inquiries' => 'inquiries#create'
  get "/apply_coupons" => "coupons#show"
  patch "/apply_coupons" => "coupons#update"
end
