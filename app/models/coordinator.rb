class Coordinator < ActiveRecord::Base
	has_many :registry_coordinators,dependent: :destroy
	has_many :registries, :through => :registry_coordinators
end
