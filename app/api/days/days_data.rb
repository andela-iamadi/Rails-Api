module Days
	require 'Date'
	class Days_Data < Grape::API

		resource :days do

			# Get us all the days recorded
			desc "It should return all days"
			get do
				Day.all
			end

			get '/:id/:session_id/attendance' do
				day = Day.find(params[:id])
				session= day.sessions.where(id: params[:session_id]).first
				session.fellows
			end

			get '/:id/sessions' do
				day = Day.find(params[:id])
				day.sessions
			end

			get '/:id/:session_id' do
				day = Day.find(params[:id])
				day.sessions.where(id: params[:session_id]).first
			end

			post do
				Day.create({
					session_day: Date.parse(params[:session_day])
					})
			end

			# Fellows on a set day
			get '/:day_id/attendance' do
				Fellow.joins(:attendances).where(attendances: { 'day_id' => params[:day_id] } );
				# Attendance.where('day_id = ?', params[:day_id]);
			end

		end
	end
end
