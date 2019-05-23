class Board < ApplicationRecord
  has_many :lists, dependent: :destroy
  belongs_to :background

  validates :name, presence: true
end
