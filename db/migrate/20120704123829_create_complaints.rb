class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.string :title
      t.string :user_name      
      t.text   :user_contacts
      t.text   :body
      t.text   :replay

      t.timestamps
    end
  end
end
