class AddUserIdToSpirits < ActiveRecord::Migration[7.0]
  def change
    add_reference :spirits, :user, foreign_key: true
  end
end
