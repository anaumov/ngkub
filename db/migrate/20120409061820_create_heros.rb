class CreateHeros < ActiveRecord::Migration
  def change
    create_table :heros do |t|
      t.string :title
      t.string :slug
      t.text   :body
      t.text   :intro

      t.timestamps
    end
  end
end
