class CharacterTags < ActiveRecord::Migration[5.2]
  def change
  	drop_table :character_tags
  end
end
