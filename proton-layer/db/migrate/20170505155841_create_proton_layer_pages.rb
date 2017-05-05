class CreateProtonLayerPages < ActiveRecord::Migration[5.1]
  def change
    create_table :layer_pages do |t|
      t.references :layout
      t.string :url, null: false
      t.string :title, default: ''
      t.string :identify, null: false
      t.string :title, default: ''
      t.text :content, default: ''
      t.text :content_merged, default: ''
      t.datetime :published_at

      t.timestamps
    end

    add_index :layer_pages, :identify, unique: true
    add_index :layer_pages, :published_at
  end
end
