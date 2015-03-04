class AddIndexToPastes < ActiveRecord::Migration
  def change
    add_index :pastes, :title
  end
end
