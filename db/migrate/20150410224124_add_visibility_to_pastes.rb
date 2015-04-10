class AddVisibilityToPastes < ActiveRecord::Migration
  def change
    add_column :pastes, :visibility, :integer, default: 0
  end
end
