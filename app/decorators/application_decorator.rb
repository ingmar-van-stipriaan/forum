class ApplicationDecorator < Draper::Decorator

  def created_at
    h.content_tag :span, :class => 'time' do
      model.created_at.strftime("%d-%m-%Y %H:%M")
    end
  end

  def updated_at
    h.content_tag :span, :class => 'time' do
      model.updated_at.strftime("%d-%m-%Y %H:%M")
    end
  end


end