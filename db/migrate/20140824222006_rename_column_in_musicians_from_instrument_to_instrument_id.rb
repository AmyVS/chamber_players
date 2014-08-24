class RenameColumnInMusiciansFromInstrumentToInstrumentId < ActiveRecord::Migration
  def change
    remove_column :musicians, :instrument, :string
    add_column :musicians, :instrument_id, :integer
  end
end
