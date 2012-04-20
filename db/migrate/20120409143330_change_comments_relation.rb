class ChangeCommentsRelation < ActiveRecord::Migration
  def change
    change_table :comments do |t|
      t.references :commentable, :polymorphic => true
    end
  end
end
