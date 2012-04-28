class AddPicsToTables < ActiveRecord::Migration
  def up
    change_table :heros do |t|
      t.has_attached_file :heropic
    end

    change_table :interviews do |t|
      t.has_attached_file :personpic
    end

    change_table :teles do |t|
      t.has_attached_file :telepic
    end
  end

  def down
    drop_attached_file :heros,      :heropic
    drop_attached_file :interviews, :personpic
    drop_attached_file :teles,      :telepic
  end
end
