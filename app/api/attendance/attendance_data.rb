module attendance
	class Attendance_Data < Grape::API

		resource :fellows do

			# Lets return a list of all registered fellows

			desc "It should return a list of all fellows"

			get do
				Fellow.all
			end
		end
	end
end
