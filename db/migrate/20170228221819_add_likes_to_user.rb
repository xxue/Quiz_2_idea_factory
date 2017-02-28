class AddLikesToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :likes, foreign_key: true
  end
end
