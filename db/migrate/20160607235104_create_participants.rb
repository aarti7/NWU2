class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :name
      t.string :gender
      t.date :date_of_birth
      t.date :date_of_enrollment
      t.string :contact_method
      t.text :remarks
      t.string :coordinator

      t.timestamps null: false
    end
  end
end
