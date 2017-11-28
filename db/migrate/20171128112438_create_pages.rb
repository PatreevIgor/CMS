class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :title
      t.text :description
      t.string :slug
      t.string :menu_label
      t.string :h1
      t.string :content
      t.datetime :published_at
      t.integer :priority

      t.timestamps
    end
  end
end
