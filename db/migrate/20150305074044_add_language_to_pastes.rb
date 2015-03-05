class AddLanguageToPastes < ActiveRecord::Migration
  def change
    add_column :pastes, :language, :string, null: false
  end
end
