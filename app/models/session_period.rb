class SessionPeriod < ActiveRecord::Base
  has_many :attendances
  belongs_to :day
  belongs_to :session
  has_many :attendances, through: :fellows
end
