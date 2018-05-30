module AnalyticsHelper

  def links
    [
      "minute",
      "hour",
      "day",
      "week",
      "month",
      "year"
    ]
  end

  def view_by_links
    list = ''
    links.each do |link|
      list << tag.li do
        link_to "Last #{link.capitalize}", analytics_show_path(view_by: link.to_sym)
      end
    end
    list.html_safe
  end

end
