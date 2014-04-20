module ApplicationHelper

  def format_date(input_date)
    return input_date.strftime("%d-%m-%Y %H:%M")
  end
  
end
