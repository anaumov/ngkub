# encoding: utf-8
class CalendarCell < Cell::Rails
  helper CalendarHelper
  def category category
    @category = category
    @date = Date.today
    @news_by_date = category.publications.this_month.all.group_by(&:published_on)
    render
  end
end
