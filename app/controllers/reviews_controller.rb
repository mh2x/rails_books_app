class ReviewsController < ApplicationController

    def index
        @book = Book.find(params[:book_id])
        @reviews = @book.reviews
    end

    def new
    	 @book = Book.find(params[:book_id])
         @review = @book.reviews.new
    end

    def create
         @book = Book.find(params[:book_id])
         review_params = params.require(:review).permit(:name, :comment, :stars)
		 @review = @book.reviews.new(review_params)
		if @review.save
			flash[:notice] = "Thanks for leaving me a review!"
			redirect_to book_reviews_path(@book, @review)
		else
			#flash[:alert] = "You haz errors!"
			#render :new, :alert => "Errors!"
			render :new
		end
	end

end
