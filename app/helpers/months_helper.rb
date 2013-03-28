# encoding: utf-8
module MonthsHelper
  def month date
    case date.strftime('%m')
    when "01"
      "Январь"
    when "02"
      "Февраль"
    when "03"
      "Март"
    when "04"
      "Апрель"
    when "05"
      "Май"
    when "06"
      "Июнь"
    when "07"
      "Июль"
    when "08"
      "Август"
    when "09"
      "Сентябрь"
    when "10"
      "Октябрь"
    when "11"
      "Ноябрь"
    when "12"
      "Декабрь"
    else
      "брь"
    end
  end
end
