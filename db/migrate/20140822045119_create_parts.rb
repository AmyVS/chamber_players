class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.column :instrument, :string
      t.column :piece_id, :integer

      t.timestamps
    end
  end
end
