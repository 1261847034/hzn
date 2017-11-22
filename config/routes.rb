Rails.application.routes.draw do
  root :to => redirect('/api_doc/index.html')
end
