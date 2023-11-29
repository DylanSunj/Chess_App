class RemoveAttendeesCountFromEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :attendees_count, :integer
  end
end
