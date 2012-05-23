class AddPublicateToAllContent < ActiveRecord::Migration
  def change
    add_column :publications, :publish, :boolean, :default => false
    add_column :interviews, :publish, :boolean, :default => false
    add_column :teles, :publish, :boolean, :default => false
    add_column :pages, :publish, :boolean, :default => false
    add_column :heros, :publish, :boolean, :default => false
  end
end
