module ApplicationHelper
  def human_time(datetime)
    datetime.strftime('%d/%m/%Y, at %H:%M')
  end
end
