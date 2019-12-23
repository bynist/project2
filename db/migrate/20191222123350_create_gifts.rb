class CreateGifts < ActiveRecord::Migration[6.0]
  def change
    create_table :gifts do |t|
      t.string :name
      t.string :link
      t.decimal :price
      t.string :where_to_buy
      t.text :description
      t.boolean :status ,null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
