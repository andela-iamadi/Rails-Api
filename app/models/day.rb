class Day < ActiveRecord::Base
  has_many :session_periods
  has_many :sessions, through: :session_periods
  has_many :attendances, through: :session_periods
end
