class ChangeNameOfLinkIdInComments < ActiveRecord::Migration
  def up
  	remove_column :comments, :link_id
  end

  def down
  	add_column :comments, :commentable_id,  :integer
  end
end
