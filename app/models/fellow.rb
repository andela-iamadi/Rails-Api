class Fellow < ActiveRecord::Base
	has_one :user
	has_many :session_periods
	has_many :attendances, through: :session_periods
	belongs_to :session
end
