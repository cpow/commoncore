# encoding: utf-8
module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:div, msg, :id => "flash_errors") }.join

    html = <<-HTML
    <div class="alert alert-error fade in">
      <a class="close" data-dismiss="alert">×</a>
      #{messages}
    </div>
    HTML

    html.html_safe
  end
end
