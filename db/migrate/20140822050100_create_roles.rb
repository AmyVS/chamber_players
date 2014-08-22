class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.column :part_id, :integer
      t.column :musician_id, :integer

      t.timestamps
    end
  end
end
