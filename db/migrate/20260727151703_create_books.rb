class CreateBooks < ActiveRecord::Migration[7.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :genres
      t.text :plot_summary
      t.integer :page_count
      t.timestamps
    end
  end
end
