class AddLikesToIdeas < ActiveRecord::Migration[5.0]
  def change
    add_reference :ideas, :likes, foreign_key: true
  end
end
