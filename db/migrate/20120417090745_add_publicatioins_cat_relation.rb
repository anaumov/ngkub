class AddPublicatioinsCatRelation < ActiveRecord::Migration
  def change
    change_table :publications do |t|
      t.references :category
    end
  end
end
