class CreateRegistryParticipants < ActiveRecord::Migration
  def change
    create_table :registry_participants do |t|
      t.integer :registry_id
      t.integer :participant_id

      t.timestamps null: false
    end
  end
end
