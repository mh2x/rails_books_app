class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :rating
      t.decimal :total_gross

      t.timestamps
    end
  end
end
