class Book < ApplicationRecord
belongs_to :user
has_many :reviews, dependent: :destroy

    validates :title, presence: true
    validates :name, presence: true
    validates :content, presence: true, length: { minimum: 5 }
    validates :rating, presence: true, inclusion: { in: 1..5 } 
end
