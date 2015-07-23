module Sess_ion
	class Session_Data < Grape::API

		resource :sessions do

			# show all sessions
			desc "it returns all sessions"

			get do
				Session.all
			end

			# adding a session
			desc "It adds a session to the list of sessions"

			# Ensure parameters passed are of correct type
			params do
				requires :name, type: String
				requires :start_time, type: String
				requires :end_time, type: String
			end
			# Add the session, having satisfied required parameters
			post do
				session = Session.create({
					name: params[:name],
					start_time: params[:start_time],
					end_time: params[:end_time],
					theme: params[:theme]
					})
				day = Day.where(session_day: params[:date]).first
				day.sessions << session
			end

			# Deleting an added session
			desc "It deletes a session from a list of session"

			# Ofcourse, make sure an ID was passed in
			params do
				requires :id, type: String
			end

			# Now, we can go ahead with our deleting
			delete ':id' do
				Session.find(params[:id]).destroy!
			end

			# Updating our sessions
			desc "it updates session data of a given id"

			# Yes, our last parameter check for this class
			params do
				requires :id, type: String
				requires :name, type: String
				requires :start_time, type: String
				requires :end_time, type: String
			end

			# Finally, our Updating
			put ':id' do
				Session.find(params[:id]).update({
					name: params[:name],
					start_time: params[:start_time],
					end_time: params[:end_time]
					})
			end

		end
	end
end
