class Book < ApplicationRecord

	#Validation comma-separated fields, condition
	#more details here: http://guides.rubyonrails.org/active_record_validations.html
	# in this example, we want to make sure they have values
	#to check validation on command-line, type inside rails console:
	# Book.new
	# Book.valid?   if not valid, you can see errors by typing:
	# Book.errors
	# Book.errors.full_messages
	# Book.errors.full_messages.to_sentence

	validates :title, :released_on, :rating, presence: true

	validates :description, length: { minimum: 25}
	
	validates :total_gross, numericality: { greater_than_or_equal_to: 0}

	validates :img_file_name, allow_blank: true, format: {
		with: /\w+\.(gif|jpg|png)\z/i,
		message: "must reference a GIF, JPG, or PNG image" 
		}

	RATINGS = %w(G PG PG-13 R NC-17)
	validates :rating, inclusion: { in: RATINGS}

	def self.released
		where("released_on <= ?", Time.now).order("released_on desc")
	end
end
