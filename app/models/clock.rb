class Clock < ActiveRecord::Base
  belongs_to :staffs
  has_one :reason
end
