class ProductionSeries < ActiveRecord::Base
  belongs_to :brand

  has_many :productions, :dependent => :nullify
end
