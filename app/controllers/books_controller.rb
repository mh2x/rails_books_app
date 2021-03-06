class BooksController < ApplicationController
	 skip_before_action :verify_authenticity_token
	def index
		@booklist =['Jungle book', 'Tarzan', 'The iron giant']
		#@books2 = Book.all
		@books2 = Book.released
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
		book_params = params.require(:book).permit(:title, :description, :rating, :released_on, :total_gross, :img_file_name, :page_count)
		if @book.update(book_params)
			#after update, go back to original object
			flash[:notice] = "Successfully Updated!"
			redirect_to @book
		else
			render :edit
		end
	end
	def new
		#this shows the form to create a new resource
		@book = Book.new
	end
	def create
		book_params = params.require(:book).permit(:title, :description, :rating, :released_on, :total_gross, :img_file_name, :page_count)
		@book = Book.new(book_params)
		if @book.save
			flash[:notice] = "Successfully Created!"
			redirect_to @book
		else
			#flash[:alert] = "You haz errors!"
			#render :new, :alert => "Errors!"
			render :new
		end
	end
	def destroy

		@book = Book.find(params[:id])
		if @book.destroy
			flash[:notice] = "Successfully Destroyed!"
			redirect_to books_path
		else
			redirect_to @boook
		end
	end	
end
