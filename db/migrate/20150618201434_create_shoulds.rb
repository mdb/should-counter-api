class CreateShoulds < ActiveRecord::Migration
  def change
    create_table :shoulds do |t|
      t.string :context
      t.string :user

      t.timestamps null: false
    end
  end
end
