require 'site_prism'
class MyDetails < SitePrism::Page

  attr_reader :my_details_address

  element :my_details_page, '.page_title'
  elements :my_details_options, '.dep.links>li>a'
  element :my_details_address, '#user_email'

  def click_on(button_name)
    my_details_options.select { |option| option.text == button_name }.first.click
  end

end