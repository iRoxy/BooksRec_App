class Book < ActiveRecord::Base
    
    belongs_to :user
    
    # Validations allow for completely nil records within database
    validates :title, presence: true, length: {minimum: 3, maximum: 50}
    validates :author, presence: true, length: {minimum: 10, maximum: 50}
    validates :genre, presence: true, length: {minimum: 5, maximum: 50}
    validates :description, presence: true, length: {minimum: 3, maximum: 5000}
    validates :user_id, presence: true
    
end