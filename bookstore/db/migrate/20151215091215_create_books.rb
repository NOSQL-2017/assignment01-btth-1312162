class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :author_id
      t.integer :publisher_id
      t.integer :category_id
      t.string :title
      t.string :isbn
      t.string :format
      t.text :excerpt
      t.integer :pages
      t.string :year
      t.string :price

      t.timestamps null: false
    end
  end
end
