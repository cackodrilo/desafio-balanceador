Rails.application.routes.draw do
  root "home#index"
  post "/balanceador", to: "home#balanceador"
end
