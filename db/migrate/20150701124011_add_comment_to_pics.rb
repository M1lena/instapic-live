class AddCommentToPics < ActiveRecord::Migration
  def change
    add_column :pics, :comment, :text
  end
end
