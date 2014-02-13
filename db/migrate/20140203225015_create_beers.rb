class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.integer :brewer_id
      t.integer :format_id
      t.float :price
      t.integer :style_id
      t.float :abv
      t.text :note
      t.integer :location_id

      t.timestamps
    end
  end
end
