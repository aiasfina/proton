class CreateProtonLayerLayouts < ActiveRecord::Migration[5.1]
  def change
    create_table :layer_layouts do |t|
      t.references :parent
      t.string :identify, null: false
      t.string :title, null: false
      t.text :content, default: ''

      t.timestamps
    end

    add_index :layer_layouts, :identify, unique: true
  end
end
