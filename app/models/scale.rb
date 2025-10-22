class Scale < ApplicationRecord
  has_many :surveys, dependent: :destroy
  has_many :questions, dependent: :destroy
  validates :title, presence: true
end
