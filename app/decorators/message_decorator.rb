class MessageDecorator < ApplicationDecorator
  delegate_all

  def remove_link
    h.link_to "Verwijder", h.topic_message_path(self.topic.id, self.id), :method => :delete, :confirm => "Zeker weten?"
  end 

  def user_message(the_user)
    model.user.id == the_user.id
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
