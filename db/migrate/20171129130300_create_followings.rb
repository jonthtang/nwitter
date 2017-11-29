class CreateFollowings < ActiveRecord::Migration[5.1]
  def change
    create_table :followings do |t|
      t.references :follower
      t.references :followee
      t.timestamps
    end

    add_foreign_key :followings, :users, column: :follower_id
    add_foreign_key :followings, :users, column: :followee_id
  end
end
