class User < ApplicationRecord
  has_many :surveys, foreign_key: :owner_id, dependent: :nullify
  has_many :questions, dependent: :nullify
  has_many :responses, dependent: :nullify
  validates :email, presence: true, uniqueness: true
end
