class ChangeTypeFieldsContentAndDescription < ActiveRecord::Migration[5.1]
  def change
    change_column :pages, :content, :text
    change_column :pages, :description, :string
  end
end
