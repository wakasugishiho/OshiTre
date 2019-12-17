class ProductionTags < ActiveRecord::Migration[5.2]
  def change
  	drop_table :production_tags
  end
end
