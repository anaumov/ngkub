class AddSlugUniqEverywhere < ActiveRecord::Migration
  def change
    change_column :publications, :slug, :string, :unique => true  
    change_column :interviews, :slug, :string, :unique => true  
    change_column :teles, :slug, :string, :unique => true  
    change_column :categories, :slug, :string, :unique => true  
    change_column :heros, :slug, :string, :unique => true  
  end
end
