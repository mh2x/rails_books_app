module BooksHelper

    def image_for(book)
        if book.img_file_name.blank?
            "placeholder.png" 
        else
            book.img_file_name
        end
    end
end
