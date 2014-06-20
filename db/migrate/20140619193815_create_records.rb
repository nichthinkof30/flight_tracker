class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :lowest
      t.integer :highest
      t.integer :tracker_id

      t.timestamps
    end
  end
end
