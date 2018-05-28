class AddVoteToUserRelationship < ActiveRecord::Migration[5.2]
  def change
    add_column :votes, :user_id, :integer
    add_column :users, :vote_id, :integer
  end
end
