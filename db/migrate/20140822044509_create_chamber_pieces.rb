class CreateChamberPieces < ActiveRecord::Migration
  def change
    create_table :chamber_pieces do |t|
      t.column :title, :string
      t.column :composer, :string
      t.column :number_of_parts, :integer

      t.timestamps
    end
  end
end
