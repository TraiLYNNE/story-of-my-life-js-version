class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.integer :page_number
      t.datetime :date
      t.string :quote
      t.string :thank_you
      t.string :lesson_learned
      t.integer :chapter_id

      t.timestamps
    end
  end
end
