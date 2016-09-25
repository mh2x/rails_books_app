Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "books#index"
 
 resources :books do 
    #
    # get "books" => "books#index"
    # get "books/:id" => "books#show", as: "book"
    # get "books/:id/edit" => "books#edit", as: "edit_book"
    # get "books/new" => "books#new"
    #update
    # patch "books/:id" => "books#update"

    # we added this from the command-line:
    # rails g resource Review name:string starts:integer comment:text book:references --no-test-framework
    # Output is:
    # Running via Spring preloader in process 8592
    #       invoke  active_record
    #       create    db/migrate/20160925230948_create_reviews.rb
    #       create    app/models/review.rb
    #       invoke  controller
    #       create    app/controllers/reviews_controller.rb
    #       invoke    erb
    #       create      app/views/reviews
    #       invoke    helper
    #       create      app/helpers/reviews_helper.rb
    #       invoke    assets
    #       invoke      coffee
    #       create        app/assets/javascripts/reviews.coffee
    #       invoke      scss
    #       create        app/assets/stylesheets/reviews.scss
    #       invoke  resource_route
    #        route    resources :reviews
    resources :reviews
  end
end
