class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.string :title, :url
      t.text :description
       t.timestamps
    end
  end

  def down
    drop_table :posts
  end
end
