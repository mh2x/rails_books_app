class AddFieldsToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :description, :text
    add_column :books, :released_on, :date
  end
end
