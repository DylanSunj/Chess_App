class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :location
      t.datetime :date
      t.text :description
      t.integer :people
      t.integer :attendees_count

      t.timestamps
    end
  end
end
