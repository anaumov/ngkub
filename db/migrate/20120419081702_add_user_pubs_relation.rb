class AddUserPubsRelation < ActiveRecord::Migration
  def change
    change_table :publications do |t|
      t.references :user
    end
  end
end
