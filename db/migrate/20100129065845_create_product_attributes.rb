class CreateProductAttributes < ActiveRecord::Migration
  def self.up
    create_table :product_attributes do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :product_attributes
  end
end
