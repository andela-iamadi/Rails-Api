module Users
  class Users_Data < Grape::API

    resource :users do
      desc "It should send a list of all users"

      get do
        User.all
      end

    end
  end
end
