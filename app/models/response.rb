class Response < ApplicationRecord
  belongs_to :survey
  belongs_to :question
  belongs_to :user
  validates :value, presence: true
end
