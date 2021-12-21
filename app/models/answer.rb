class Answer < ApplicationRecord
  belongs_to :question
  has_many :likes, as: :reference, dependent: :destroy 
end
