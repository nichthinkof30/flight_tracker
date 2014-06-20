class CreateTrackers < ActiveRecord::Migration
  def change
    create_table :trackers do |t|
      t.string :origin
      t.string :destination
      t.string :from_date
      t.string :to_date
      t.integer :user_id

      t.timestamps
    end
  end
end
