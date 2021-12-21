class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
  has_many :likes, as: :reference, dependent: :destroy
  acts_as_taggable_on :tags
end
