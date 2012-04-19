class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :user_pic
      t.text   :about

      t.timestamps
    end

  end
end
