class Staff < ActiveRecord::Base
  has_many :clocks
  validates :name, presence: true
  validates :start, presence: true
end
