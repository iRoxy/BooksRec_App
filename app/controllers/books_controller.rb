class BooksController < ApplicationController
    
    # All the actions available
    
    def new
        @book = Book.new
    end
    
    def index
        @allBooks = Book.all
    end
    
    def create
        #render plain: params[:book].inspect
        @book = Book.new(book_params)
        if @book.save
            # do something
            flash[:success] = "Book was successfully stored"
            redirect_to book_path(@book)
        else
            render 'new'
        end
    end
    
    def edit
        @book = Book.find(params[:id])
    end
    
    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            flash[:success] = "Book was successfully updated"
            redirect_to book_path(@book)
        else
            render 'edit'
        end
    end
    
    def show
        @book = Book.find(params[:id])
    end
    
    def destroy
        @book = Book.find(params[:id])
        @book.destroy(book_params)
        flash[:danger] = "Book was successfully removed"
        redirect_to books_path
    end
    
    private
    def book_params
        params.require(:book).permit(:title, :author, :genre, :description)
    end
end