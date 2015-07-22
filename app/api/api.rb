class API < Grape::API
	prefix 'api'
	version 'v1', using: :path
  format :json
	mount Sess_ion::Session_Data
	mount Fellows::Fellow_Data
	mount Attendances::Attendance_Data
	mount Days::Days_Data
  mount Users::Users_Data
  mount Session_Periods::Session_Period_Data
end
