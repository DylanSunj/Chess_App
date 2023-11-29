class CreateAttendees < ActiveRecord::Migration[7.0]
  def change
    create_table :attendees do |t|
      t.integer :user
      t.integer :event

      t.timestamps
    end
  end
end
