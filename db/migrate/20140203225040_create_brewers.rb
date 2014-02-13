class CreateBrewers < ActiveRecord::Migration
  def change
    create_table :brewers do |t|
      t.string :name
      t.string :location
      t.string :account

      t.timestamps
    end
  end
end
