Rails.application.routes.draw do
  scope 'escort/:id' do
    resource :identification,
      only: %i[ show update ],
      controller: :escorts,
      page: :identification
    resource :risks,
      only: %i[ show update ],
      controller: :escorts,
      page: :risks
    get 'summary', controller: :escorts
    resource :pdf, only: :show
  end
  resource :escort, only: %i[ index create ]
  resource :home_page, path: '/', only: %i[ show ] do
    post :search
  end
  root to: 'home_pages#show'
end
