class AddMorefieldsToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :img_file_name, :string, default: ""
    add_column :books, :page_count, :decimal
  end
end
