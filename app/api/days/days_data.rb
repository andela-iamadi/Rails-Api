module Days
	class Days_Data < Grape::API

		resource :days do

			# Get us all the days recorded
			desc "It should return all days"
			get do
				Day.all
			end

			# Fellows on a set day
			get '/:day_id/attendance' do
				Fellow.joins(:attendances).where(attendances: {'day_id': params[:day_id] } );
				# Attendance.where('day_id = ?', params[:day_id]);
			end

		end
	end
end
