class CreateRegistries < ActiveRecord::Migration
  def change
    create_table :registries do |t|
      t.string :name
      t.string :location
      t.boolean :open

      t.timestamps null: false
    end
  end
end
