class CreateBrohooves < ActiveRecord::Migration
  def change
    create_table :brohooves do |t|
      t.references :post
      t.references :user

      t.timestamps
    end
    add_index :brohooves, :post_id
    add_index :brohooves, :user_id
  end
end
