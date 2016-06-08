class CreateRegistryCoordinators < ActiveRecord::Migration
  def change
    create_table :registry_coordinators do |t|
      t.integer :registry_id
      t.integer :coordinator_id

      t.timestamps null: false
    end
  end
end
