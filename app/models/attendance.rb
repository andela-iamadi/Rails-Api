class Attendance < ActiveRecord::Base
	belongs_to :fellow
	belongs_to :day
end
