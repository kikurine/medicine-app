# config/routes.rb
Rails.application.routes.draw do
  root "records#index"
  
  # welcome ではなく records に合わせる
  post "record_dose/:id", to: "records#record_dose", as: "record_dose"
end