class Production < ActiveRecord::Base
  belongs_to :brand
  belongs_to :brand_category, :class_name => 'Tag'
  belongs_to :category,       :class_name => 'ProductionCategory'
  belongs_to :series,         :class_name => 'ProductionSeries'

  has_many :pictures, :as => :attachable
  has_many :properties, :class_name => 'ProductionProperty'
  has_many :attributes, :through => :category
end
