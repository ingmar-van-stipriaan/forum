class TopicDecorator < ApplicationDecorator
  decorates_association :messages
  delegate_all


  def edit_link
    h.link_to "Bewerk", h.edit_topic_path(model.id), :class => "btn btn-default"
  end

  def delete_link
    h.link_to "Verwijder", h.topic_path(model.id), :method => :delete, :confirm => "Weet u dit zeker?", :class => "btn btn-danger"
  end

  
end
