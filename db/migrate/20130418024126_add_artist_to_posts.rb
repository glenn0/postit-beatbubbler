class AddArtistToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :artist, :string
  end
end
