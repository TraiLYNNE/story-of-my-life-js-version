class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.datetime :time
      t.string :mood
      t.text :content
      t.integer :page_id

      t.timestamps
    end
  end
end
