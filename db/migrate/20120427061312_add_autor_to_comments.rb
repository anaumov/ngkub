class AddAutorToComments < ActiveRecord::Migration
  def change
    change_table :comments do |t|
      t.string :autor
    end
  end
end
