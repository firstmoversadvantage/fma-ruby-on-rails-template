module ApplicationHelper
  def bootstrap_class_for_flash(flash_type)
    case flash_type
    when 'success'
      'alert-success'
    when 'error'
      'alert-danger'
    when 'alert'
      'alert-warning'
    when 'notice'
      'alert-info'
    else
      flash_type.to_s
    end
  end

  def flash_message_is_cookie_info(msg)
    msg == "This site uses cookies. See our <a href='/cookie-policy'>Cookie Policy</a> for details."
  end
end
