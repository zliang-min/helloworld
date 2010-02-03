# 保存产品的各种属性（技术参数）值。
class ProductionProperty < ActiveRecord::Base
  belongs_to :production_category
  belongs_to :attribute, :class_name => 'ProductionAttribute'
  belongs_to :production

  before_save :set_attribute_name

  private
  # 沉余保存attribue的名称，免得每次都要关联attribute进来查询。
  def set_attribute_name
    self.attribute_name = attribute.name
  end
end
