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

  def user_is(the_user)
    model.user.id == the_user.id
  end

end