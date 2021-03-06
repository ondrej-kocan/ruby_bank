Rails.application.routes.draw do
  root 'sessions#new'

  get    'login'     => 'sessions#new'
  post   'login'     => 'sessions#create'
  delete 'logout'    => 'sessions#destroy'

  get    'account'   => 'accounts#show'

  post   'transfer'  => 'accounts#transfer'

end
