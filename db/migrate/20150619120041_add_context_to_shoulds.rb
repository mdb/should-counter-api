class AddContextToShoulds < ActiveRecord::Migration
  def change
    add_column :shoulds, :context, :string
  end
end
