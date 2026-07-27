class CreateThemeNotes < ActiveRecord::Migration[7.2]
  def change
    create_table :theme_notes do |t|
      t.string :theme_name
      t.text :description
      t.integer :page_number
      t.references :book, foreign_key: true
      t.timestamps
    end
  end
end
