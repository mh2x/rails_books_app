class Review < ApplicationRecord
  belongs_to :book

  #Adding validation
  validates :name, presence: true
  validates :comment, length: { minimum: 25}
  
  STARS = [1, 2, 3, 4, 5]

  validates :stars, inclusion: { 
      in: STARS, 
      message: "must be between 1 and 5"
    }

end
