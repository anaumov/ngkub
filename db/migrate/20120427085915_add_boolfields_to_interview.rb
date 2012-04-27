class AddBoolfieldsToInterview < ActiveRecord::Migration
  def change
    change_table :interviews do |t|
      t.boolean :openquest
      t.boolean :questpub
      t.string  :pubdate
    end
  end
end
