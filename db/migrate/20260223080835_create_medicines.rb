class CreateMedicines < ActiveRecord::Migration[8.1]
  def change
    create_table :medicines do |t|
      t.string :name
      t.date :start_date
      t.integer :interval_days

      t.timestamps
    end
  end
end
