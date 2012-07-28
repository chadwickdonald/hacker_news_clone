class ChangeNameOfVotesCountInPosts < ActiveRecord::Migration
  def up
     remove_column :links, :votes
  end

  def down
    add_column :links, :votes, :integer
  end
end
