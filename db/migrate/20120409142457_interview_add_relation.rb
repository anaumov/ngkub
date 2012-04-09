class InterviewAddRelation < ActiveRecord::Migration
  def change
    change_table :questions do |t|
      t.references :interview
    end
  end
end
