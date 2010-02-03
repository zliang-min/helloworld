class Brand < ActiveRecord::Base
  set_table_name 'product_brands'

  has_many :tagged_brands
  has_many :production_series

  default_scope :order => 'name_en'

  named_scope :of_tag, lambda { |tag_id|
    {
      :joins => 'JOIN tagged_brands ON product_brands.id = tagged_brands.brand_id',
      :conditions => ['tagged_brands.tag_id = ?', tag_id]
    }
  }
end
