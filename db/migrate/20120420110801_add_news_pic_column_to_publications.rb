class AddNewsPicColumnToPublications < ActiveRecord::Migration
  def up
    change_table :publications do |t|
      t.has_attached_file :newspic
    end
  end

  def down
    drop_attached_file :publications, :newspic
  end
end
