module Wysihtml5Helper
  def fill_in_html element_id, options
    options.to_options!.assert_valid_keys :with
    if Capybara.current_driver == Capybara.javascript_driver
      page.execute_script %{$("##{element_id}").data("wysihtml5").editor.setValue(#{options[:with].to_json})}
    else
      fill_in element_id, options
    end
  end
end

RSpec.configure{|config| config.include Wysihtml5Helper}