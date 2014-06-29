class Manufacturer < ActiveRecord::Base
  has_many :cars

  validates :name
  validates :country
end
