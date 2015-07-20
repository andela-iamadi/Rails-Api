class Session < ActiveRecord::Base
	has_many :days
	has_many :fellows
	has_many :attendances, through: :day
end
