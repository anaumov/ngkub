class AddYoutubeToTeles < ActiveRecord::Migration
  def change
    add_column :teles, :youtube, :text
  end
end
