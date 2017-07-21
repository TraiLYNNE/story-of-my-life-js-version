class CreateImportantDates < ActiveRecord::Migration[5.0]
  def change
    create_table :important_dates do |t|
      t.string :title
      t.datetime :date
      t.integer :chapter_id

      t.timestamps
    end
  end
end
