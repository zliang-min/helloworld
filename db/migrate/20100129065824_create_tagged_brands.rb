class CreateTaggedBrands < ActiveRecord::Migration
  def self.up
    create_table :tagged_brands do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :tagged_brands
  end
end
