class AddUserToShoulds < ActiveRecord::Migration
  def change
    add_column :shoulds, :user, :string
  end
end
