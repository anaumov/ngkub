class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.string :title
      t.string :slug
      t.text   :body
      t.text   :intro

      t.timestamps
    end
  end
end
