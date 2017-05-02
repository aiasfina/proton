class SorceryCore < ActiveRecord::Migration[5.1]
  def change
    create_table :core_users do |t|
      t.string :email,            :null => false
      t.string :crypted_password
      t.string :salt

      t.timestamps                :null => false
    end

    add_index :core_users, :email, unique: true
  end
end
