class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.integer "user_id"
      t.string "title"
      t.text "body"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.timestamps
    end
  end
end
