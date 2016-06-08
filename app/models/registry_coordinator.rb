class RegistryCoordinator < ActiveRecord::Base
	belongs_to :registry
	belongs_to :coordinator
end
