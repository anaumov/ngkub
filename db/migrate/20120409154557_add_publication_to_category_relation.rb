class AddPublicationToCategoryRelation < ActiveRecord::Migration
  def change
    change_table :comments do |t|
      t.references :category
    end
  end
end
