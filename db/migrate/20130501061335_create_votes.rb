class CreateVotes < ActiveRecord::Migration
  def up
    create_table :votes do |t|
      t.integer :user_id
      t.boolean :vote
      t.references :voteable, polymorphic: true # creates voteable_type & voteable_id columns
      t.timestamps
    end
  end

  def down
    drop_table :votes
  end
end
