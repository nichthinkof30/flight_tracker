module ApplicationHelper
  def flash_class(level)
    case level
    when 'success' then "alert alert-success fade in"
    when 'notice' then "alert alert-info fade in"
    when 'alert' then "alert alert-danger fade in"
    when 'error' then "alert alert-error fade in"
    when 'warning' then "alert alert-warning fade in"
    end
  end
end
