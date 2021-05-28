class UserDecorator < Draper::Decorator
  delegate_all

  def full_name
    h.content_tag(:p, "Full Name: #{ first_name } #{ last_name }")
  end
end
