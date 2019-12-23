class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.timestamps
      t.integer :user_id
      t.string :title
      t.string :image_id
      t.text :body
      t.boolean :flag, default: true
    end
  end
end
