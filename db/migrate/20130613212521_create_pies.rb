class CreatePies < ActiveRecord::Migration
  def change
    create_table :pies do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
