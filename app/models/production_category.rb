class ProductionCategory < ActiveRecord::Base
  has_many :productions, :dependent => :destroy
  has_many :attributes,  :dependent => :destroy, :class_name => 'ProductionAttribute'
end
