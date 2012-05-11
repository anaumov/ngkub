class AddPlaceAndPubToBanners < ActiveRecord::Migration
  def change
    add_column :banners, :publish, :boolean, :default => false
    add_column :banners, :place, :string
  end
end
