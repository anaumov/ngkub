class AddIssueOldidToPublication < ActiveRecord::Migration
  def change
    add_column :publications, :old_id, :integer
    add_column :publications, :issue, :integer
  end
end
