module Fellows
	class Fellow_Data < Grape::API

		resource :fellows do

			# This part sends a list of all fellows
			desc "It should send a list of all registered fellows"

			get do
				Fellow.all
			end
			# Retrieves a list of fellows according to an optional condition
			desc "Retrieves conditionally"

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

			def set_params
				{
					first_name: params[:first_name],
					last_name: params[:last_name],
					email: params[:last_name]
				}
			end

			get ':id' do
				Fellow.find(params[:id])
			end


			# Create new when this is hit
			desc "Create fellows when this route is hit"

			# Put in data
			has_params?
			post do
				Fellow.create!(set_params)
			end

			# Now for the update part
			desc "The fellows list can get updated at an id"

			has_params?
			put do
				Fellow.find(params[:id]).update(set_params)
			end

			# Yes! The delete part
			desc "It deletes a fellow data at an id"

			delete ':id' do
				Fellow.find(params[:id].destroy!) if has_id?
			end

		end
	end
end
