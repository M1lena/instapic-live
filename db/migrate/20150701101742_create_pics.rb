class CreatePics < ActiveRecord::Migration
  def change
    create_table :pics do |t|
      t.string :message
      t.integer :likes

      t.timestamps null: false
    end
  end
end
