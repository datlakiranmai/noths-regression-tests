require 'site_prism'
require 'rspec/expectations'

class HomePage < SitePrism::Page
  include Capybara::DSL
  include Poltergeist

  element :register_button, '.register_link.last.button_medium_mobile'
  element :signin_button, '.sign_in_link.button_medium_mobile'
  #element :signed_in_user, '.title.my_account_link.mobile_hide'
  element :signed_in_user, '.title_container.my_account_title'
  element :favourite_inactive_btn, '#favourites_heart_inactive'
  elements :footer_link, '.n-links-list__link'
  element :sign_out_btn, '.cta_button.sign_out_button.submit.button.secondary.medium'


  #Welcome Screen
  element :page_title, '.page_title'
  element :info, '.message.info.with_icon'
  element :new_customer, '#button_new_customer'


  def navigate(link=nil)
    begin
       visit(link)
    rescue Net::ReadTimeout
      retry
    end
    raise "We have trouble accessing QA Env. #{ENV['ENV_ID']} might be dead!" unless page.has_css?('.sign_in_link.button_medium_mobile')
  end

  def hover_myaccounts
    if headless?
      try_until(20) { find('.title.my_account_link.mobile_hide').trigger('click') }
    else
      find('.title.my_account_link.mobile_hide').hover
    end
  end

  def navigate_to_myaccounts
    signed_in_user.click
  end

  def click_on(button_name)
    case button_name
      when 'Register'
        register_button.click
      when 'Signin'
        signin_button.click
      when 'Favourite'
        if headless?
          page.driver.click(1731.5, 73)
        else
          favourite_inactive_btn.click
        end
      when 'Sign out'
        if headless?
          try_until(20) { sign_out_btn.trigger('click') }
        else
        sign_out_btn.click
        end
      when 'Continue'
        new_customer.click
    end
  end

  def click_on_link(link_name)
    if headless?
      footer_link.select { |l| l.text == link_name }.first.trigger('click')
    else
      footer_link.select { |l| l.text == link_name }.first.click
    end
  end
end
