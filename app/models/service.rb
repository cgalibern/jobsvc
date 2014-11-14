class Service < ActiveRecord::Base
	has_many :jobs, dependent: :destroy
	[ :svcname, :status].each { |col| validates_presence_of col }
end
