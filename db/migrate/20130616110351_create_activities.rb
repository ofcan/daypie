class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :pie
      t.string :title
      t.text :description
      t.time :from_time
      t.time :until_time

      t.timestamps
    end
  end
end
