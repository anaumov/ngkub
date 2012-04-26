class AddFieldsToHero < ActiveRecord::Migration
  def change
    change_table :heros do |t|
      t.string :profession
    end
  end
end
