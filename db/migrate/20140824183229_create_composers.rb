class CreateComposers < ActiveRecord::Migration
  def change
    create_table :composers do |t|
      t.column :name, :string

      t.timestamps
    end
  end
end
