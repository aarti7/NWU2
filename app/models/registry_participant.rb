class RegistryParticipant < ActiveRecord::Base
  	  belongs_to :registry
    	belongs_to :participant
end
