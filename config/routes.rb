Rails.application.routes.draw do
  root to: 'games#new'
  get 'new', to: 'games#new'
  post 'score', to: 'games#score'
  get 'score', to: 'games#score'
end
