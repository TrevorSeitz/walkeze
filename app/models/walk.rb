class Walk < ApplicationRecord
  validates :walker_name, :date, :time, :length, :available_spots, presence: true

  has_many :dogs_walks
  has_many :dogs, through: :dogs_walks

  # has_and_belongs_to_many :dogs
  #
  # accepts_nested_attributes_for :dogs
end
