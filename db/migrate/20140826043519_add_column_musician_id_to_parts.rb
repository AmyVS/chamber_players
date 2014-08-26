class AddColumnMusicianIdToParts < ActiveRecord::Migration
  def change
    add_column :parts, :musician_id, :integer
  end
end
