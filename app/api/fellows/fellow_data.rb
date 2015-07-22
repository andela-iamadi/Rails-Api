module Fellows
	class Fellow_Data < Grape::API

		resource :fellows do

			# This part sends a list of all fellows
			desc "It should send a list of all registered fellows"

			get do
				Fellow.all
			end
			# Retrieves a list of fellows according to a condition
			desc "Retrieves conditionally with the fellow's ID"

			def has_id?
				requires :id, type: Integer
			end

			def has_params?
				params do
					requires :first_name, type: String
					requires :last_name, type: String
					requires :email, type: String
				end
			end


			get ':id' do
				Fellow.find(params[:id])
			end


			# Create new when this is hit
			desc "Create fellows when this route is hit"

			# Put in data
			has_params?
			post do
				f = Fellow.create!({
					first_name: params[:first_name],
					last_name: params[:last_name],
					email: params[:email]
				})

				User.create({username: params[:username], fellow_id: f.id,
					password: params[:password]})
			end

			# Now for the update part
			desc "The fellows list can get updated at an id"

			has_params?
			put ':id' do
				Fellow.find(params[:id]).update({
					first_name: params[:first_name],
					last_name: params[:last_name],
					email: params[:email]
				})
			end

			# Yes! The delete part
			desc "It deletes a fellow data at an id"

			delete ':id' do
				Fellow.find(params[:id]).destroy
			end

		end
	end
end
