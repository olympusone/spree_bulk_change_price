Spree::Core::Engine.add_routes do
  namespace :admin do
    scope 'bulk_change_price', as: :bulk_change_price, controller: :bulk_change_price do
      get '/', action: :index
      post 'change', action: :change
    end
  end
end
