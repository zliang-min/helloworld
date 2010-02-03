# 品类
# 使用HEJIA_TAG中“品牌库”的子标签作为品类使用。
class Tag < ActiveRecord::Base
  uses_connection "51hejia_#{Rails.env}".to_sym, :in => Rails.env.to_sym

  set_table_name 'HEJIA_TAG'
  set_primary_key 'TAGID'

  # Shit, 为什么是TAGESTATE不是TAGSTATE？
  default_scope :conditions => 'TAGESTATE = 0', :order => 'TAGID'

  #品牌库的tag id，所有品类都是以这个作为父类的。由于这个id不太可能发生变化，所以可以预先读进来。
  cattr_accessor :father_id
  self.father_id =
    begin
      # “品牌库”这个标签是属于一个叫“3.0资讯分类1级”的父标签，该父标签的TAGCODE是“ZiXun3.0Class1”，这里的查询以TAGCODE为依据。这段逻辑是从radmin项目中的ArticleTag这个model里面整理出来的，不过在该model中，是写死id的（14025）。
      root_id = first(:select => :TAGID, :conditions => ['TAGCODE = ?', 'ZiXun3.0Class1']).TAGID
      first(:select => :TAGID, :conditions => ['TAGFATHERID = ? AND TAGNAME = ?', root_id, '品牌库']).TAGID
    end

  # 取得所有的“品类”。
  named_scope :categories, :joins => 'JOIN HEJIA_TAGLINK as link on HEJIA_TAG.TAGID = link.TAGID2',
    :conditions => ['link.TAGID1 = ?', father_id]

  # 取得某一品类下的所有品牌
  def brands
    Brand.of_tag(self.TAGID)
  end

end
