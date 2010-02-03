class Article < ActiveRecord::Base
  # 各种文章类型对应的CHECK_BRAND的值
  TYPES = {
    '行情' => 1,
    '导购' => 2,
    '评测' => 3,
    '热点新闻' => 4,
    '组合案例' => 5,
    '最新资讯' => 6
  }.freeze

  uses_connection "51hejia_#{Rails.env}".to_sym, :in => Rails.env.to_sym

  set_table_name "HEJIA_ARTICLE"

  # 获取某个品牌下的某个品类的所有文章
  # 品牌和文章之间的关系是通过hejia_article_link表来确定的。
  named_scope :of, lambda { |category_or_its_id, brand_or_its_id|
    category_id = category_or_its_id.is_a?(ActiveRecord) ? category_or_its_id.id : category_or_its_id
    brand_id    = brand_or_its_id.is_a?(ActiveRecord) ? brand_or_its_id.id : brand_or_its_id

    {
      :joins => 'JOIN hejia_article_link as link ON HEJIA_ARTICLE.ID = link.articleid',
      :conditions => ["link.typeid = ? AND link.typename = 'brand' AND link.firstid = ?", brand_id, category_id]
    }
  }
  # 组合案例
  named_scope :combination_cases, :conditions => ['CHECK_BRAND = ?', TYPES['组合案例']]
  # 热点新闻
  named_scope :hot_news, :conditions => ['CHECK_BRAND = ?', TYPES['热点新闻']]
  # 最新资讯
  named_scope :new_info, :conditions => ['CHECK_BRAND = ?', TYPES['最新资讯']]
  # 行情 + 导购 + 评测
  named_scope :all_info, :conditions => ['CHECK_BRAND in (?)', TYPES.values_at('行情', '导购', '评测')]
end
