class CreateTeles < ActiveRecord::Migration
  def change
    create_table :teles do |t|
      t.string :title
      t.string :slug
      t.text   :intro
      t.text   :body
      

      t.timestamps
    end
  end
end
