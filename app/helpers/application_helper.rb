module ApplicationHelper
  def make_flash_class(key)
    case key
    when :notice
      "success"
    when :alert
      "error"
    else
      "notice"
    end
  end
end
