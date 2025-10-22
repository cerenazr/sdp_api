class Survey < ApplicationRecord
  belongs_to :scale
  belongs_to :owner, class_name: "User"
  has_many :responses, dependent: :destroy
  validates :title, presence: true
end
