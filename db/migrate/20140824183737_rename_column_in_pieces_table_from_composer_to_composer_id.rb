class RenameColumnInPiecesTableFromComposerToComposerId < ActiveRecord::Migration
  def change
    remove_column :pieces, :composer, :string
    add_column :pieces, :composer_id, :integer
  end
end
