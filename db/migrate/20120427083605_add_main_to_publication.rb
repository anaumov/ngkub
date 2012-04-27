class AddMainToPublication < ActiveRecord::Migration
  def change
    change_table :publications do |t|
      t.boolean :onmain
    end
  end
end
