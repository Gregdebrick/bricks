class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.string :tagline
      t.string :size
      t.string :sku

      t.timestamps
    end
  end
end
