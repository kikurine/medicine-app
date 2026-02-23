class CreateDoseRecords < ActiveRecord::Migration[8.1]
  def change
    create_table :dose_records do |t|
      t.references :medicine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
