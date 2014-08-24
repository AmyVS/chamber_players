class CreateInstruments < ActiveRecord::Migration
  def change
    create_table :instruments do |t|
      t.column :name, :string

      t.timestamps
    end
  end
end
