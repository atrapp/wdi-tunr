Rails.application.routes.draw do

  root 'welcome#index'

  get 'songs/search' => 'songs#search'
  post 'songs/save' => 'songs#save'
  delete 'songs/:id'  => 'songs#destroy'

end
