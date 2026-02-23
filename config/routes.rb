Rails.application.routes.draw do
  root "welcome#index"
# 追加：記録用のURLを作る
  post "record_dose/:id", to: "welcome#record_dose", as: "record_dose"
end
