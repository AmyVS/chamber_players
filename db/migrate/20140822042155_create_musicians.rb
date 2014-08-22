class CreateMusicians < ActiveRecord::Migration
  def change
    create_table :musicians do |t|
      t.column :name, :string
      t.column :instrument, :string

      t.timestamps
    end
  end
end
