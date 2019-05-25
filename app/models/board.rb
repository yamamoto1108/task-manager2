class Board < ApplicationRecord
  has_many :lists, dependent: :destroy
  belongs_to :background
  belongs_to :user
  belongs_to :team

  validates :name, presence: true
end
