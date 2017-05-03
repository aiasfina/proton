class CreateProtonCorePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :proton_core_posts do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.string :type
      t.text :content, default: ''
      t.datetime :published_at

      t.timestamps
    end

    add_index :proton_core_posts, :type
    add_index :proton_core_posts, :published_at
  end
end
