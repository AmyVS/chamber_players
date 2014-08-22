class RenameTableChamberPiecesToPieces < ActiveRecord::Migration
  def change
    rename_table :chamber_pieces, :pieces
  end
end
