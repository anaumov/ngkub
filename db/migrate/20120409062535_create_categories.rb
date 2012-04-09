class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.string :slug
      t.text   :intro

      t.timestamps
    end
  end
end
