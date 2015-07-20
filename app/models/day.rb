class Day < ActiveRecord::Base
	has_many :attendances
	belongs_to :session
end
