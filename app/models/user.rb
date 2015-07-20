class User < ActiveRecord::Base
	belongs_to :fellow, :dependent => :destroy
end
