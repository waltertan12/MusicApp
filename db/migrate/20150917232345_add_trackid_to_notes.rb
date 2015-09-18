class AddTrackidToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :track_id, :integer
    add_index  :notes, :track_id
  end
end
