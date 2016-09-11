class BooksController < ApplicationController
	 skip_before_action :verify_authenticity_token
	def index
		@booklist =['Jungle book', 'Tarzan', 'The iron giant']
		@books2 = Book.all
	end
	def show
		@book = Book.find(params[:id])
	end
	
	def edit
		#show edit page
		@book = Book.find(params[:id])
	end
	def update
		#fail
		#puts (params[:id])
		#puts (params[:movie])
		@book = Book.find(params[:id])
		book_params = params.require(:book).permit(:title, :description, :rating, :released_on, :total_gross)
		@book.update(book_params)
		
		#after update, go back to original object
		redirect_to @book
	end
	def new
		#this shows the form to create a new resource
		@book = Book.new
	end
	def create
		book_params = params.require(:book).permit(:title, :description, :rating, :released_on, :total_gross)
		@book = Book.new(book_params)
		@book.save
		redirect_to @book
	end


end
