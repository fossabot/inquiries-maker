Rails.application.routes.draw do
  root to: "moving_inquiries#index"
  resources :combined_inquiries
  resources :cleaning_inquiries
  resources :moving_inquiries
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :moving_inquiries, only: [:new]
  end
  get "/:locale/*path", to: redirect("/#{I18n.default_locale}/%{path}", status: 302), constraints: {path: /(?!(#{I18n.available_locales.join("|")})\/).*/}, format: false
end
