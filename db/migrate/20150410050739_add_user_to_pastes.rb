class AddUserToPastes < ActiveRecord::Migration
  def change
    add_reference :pastes, :user, index: true, foreign_key: true
  end
end
