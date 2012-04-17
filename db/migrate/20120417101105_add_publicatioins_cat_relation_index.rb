class AddPublicatioinsCatRelationIndex < ActiveRecord::Migration
  def change
    change_table :publications do |t|
      t.references :category
    end
    add_index :publications, :category_id
  end  
end
