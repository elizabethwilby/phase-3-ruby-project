ActiveRecord::Schema[7.2].define(version: 2026_07_27_151703) do
  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "genres"
    t.text "plot_summary"
    t.integer "page_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "theme_notes", force: :cascade do |t|
    t.string "theme_name"
    t.text "description"
    t.integer "page_number"
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_theme_notes_on_book_id"
  end

  add_foreign_key "theme_notes", "books"
end
