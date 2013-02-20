class AddPublishedDateToPublication < ActiveRecord::Migration
  def change
    add_column :publications, :published_on, :date
    Publication.find_each do |publication| 
      publication.update_attribute(:published_on, publication.created_at.to_date)
    end
  end
end
