class CreatePostTags < ActiveRecord::Migration[5.2]
  def change
    create_table :post_tags do |t|
      t.integer :post_id
      t.integer :poroduction_tag_id
      t.integer :character_tag_id
      t.timestamps
    end
  end
end
ß