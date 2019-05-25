class List < ApplicationRecord
  include RankedModel
  ranks :row_order
  belongs_to :board
  has_many :cards, dependent: :destroy

  validates :name, presence: true
end
