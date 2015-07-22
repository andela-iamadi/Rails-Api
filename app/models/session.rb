class Session < ActiveRecord::Base
  has_many :fellows
  has_many :session_periods
	has_many :days, through: :session_periods
	has_many :attendances , through: :session_periods
end
