class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :title
      t.datetime :start_at
      t.datetime :end_at
      t.timestamps
    end
  end
end
