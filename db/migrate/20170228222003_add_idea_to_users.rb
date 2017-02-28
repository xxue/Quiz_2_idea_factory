class AddIdeaToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :ideas, foreign_key: true
  end
end
