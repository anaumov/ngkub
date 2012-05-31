class ChangeTextToLogtext < ActiveRecord::Migration
  def change
    change_column :publications, :body, :text, :limit => 4294967295
  end
end
