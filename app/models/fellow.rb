class Fellow < ActiveRecord::Base
	has_one :user
	has_many :attendances
	has_many :days, through: :attendances
	belongs_to :session
end
