# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def render_subnav
    # 如果模板有对应的subnav partial页面，就渲染该partial；否则什么都不做。
    if Rails.root.join(template.relative_path.sub(%r'/[^/]+$', "/_subnav.html.erb")).file?
      content_tag(:nav, :class => 'subnav') {
        render :partial => template.path_without_format_and_extension.sub(%r'/[^/]+$', '/subnav') \
      }
    end
  end
end
