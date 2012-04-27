class AddAutorToQuestion < ActiveRecord::Migration
  def change
    change_table :questions do |t|
      t.string :autor
    end
  end
end
