class Participant < ActiveRecord::Base
  has_many :registry_participants, dependent: :destroy
  has_many :registries, :through => :registry_participants

  	accepts_nested_attributes_for :registry_participants
end
