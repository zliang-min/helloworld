class CreateBrandDetails < ActiveRecord::Migration
  def self.up
    create_table :brand_details do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :brand_details
  end
end
