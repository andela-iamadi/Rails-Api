module Attendances
	class Attendance_Data < Grape::API

		resource :attendances do

			# Lets return a list of all registered fellows
			desc "It should return a list of all fellows"
			get do
				Attendance.all
			end



			def has_id?
				params do
					requires :id, type: Integer
				end
			end

			def has_params?
				params do
					requires :fellow_id, type: Integer
					requires :day_id, type: Integer
				end
			end

			def set_params
				{
					fellow_id: params[:first_name],
					day_id: params[:last_name],
					attendance_confirmed: params[:attendance_confirmed]
				}
			end

			# Now we create attendance
			desc "Route to create attendance"
			has_params?
			post do
				Attendance.create(set_params)
			end

			# So we show the attendance
			desc "It should show attendance according to specific conditions"
			get '/show' do
				Attendance.find(:conditions => params[:conditions])
			end

			# Okay, Update time!
			desc "Here, we edit the attendance"
			has_id?
			put ':id' do
				Attendance.find(params[:id]).update(set_params)
			end

			# Sure, delete, whatever
			desc "Deletes the attendance from base"
			has_id?
			delete ':id' do
				Attendance.find(params[:id]).destroy!
			end
		end
	end
end
