class Job < ActiveRecord::Base
	validates_presence_of :service_id
	belongs_to :services
end
