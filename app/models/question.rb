class Question < ApplicationRecord
  belongs_to :scale
  belongs_to :user, optional: true
  has_many :responses, dependent: :destroy
  validates :body, presence: true
end
