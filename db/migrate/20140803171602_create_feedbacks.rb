class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :sender_name
      t.string :sender_email
      t.string :comment

      t.timestamps
    end
  end
end
