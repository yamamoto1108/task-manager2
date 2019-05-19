class List < ApplicationRecord
  include RankedModel
  ranks :row_order
  belongs_to :board
  has_many :cards, dependent: :destroy
  accepts_nested_attributes_for :cards

  validates :name, presence: true
end
