module Session_Periods
  class Session_Period_Data < Grape::API

    resource :periods do
      
      get do
        SessionPeriod.all
      end
    end
  end
end