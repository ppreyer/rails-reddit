class AddPostIdToDownVote < ActiveRecord::Migration[5.2]
  def change
    add_column :downvotes, :post_id, :integer
  end
end
