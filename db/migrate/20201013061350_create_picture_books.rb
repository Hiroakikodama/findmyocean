class CreatePictureBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :picture_books do |t|
      t.integer "user_id"
      t.text "point"
      t.text "discription"
      t.text "fish_name"
      t.timestamps
    end
  end
end
