class CreateShoulds < ActiveRecord::Migration
  def change
    create_table :shoulds do |t|

      t.timestamps null: false
    end
  end
end
