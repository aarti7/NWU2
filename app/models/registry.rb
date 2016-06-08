class Registry < ActiveRecord::Base
	has_many :registry_coordinators, dependent: :destroy
	has_many :coordinators, :through => :registry_coordinators
	accepts_nested_attributes_for :registry_coordinators

	has_many :registry_participants, dependent: :destroy
	has_many :participants, :through => :registry_participants

	scope :open_registries, -> {where("open = 0")}
end
