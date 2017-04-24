require 'site_prism'

class HomePage < SitePrism::Page
  include Capybara::DSL
  include Helper

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

  #QA Env down
  element :goodness_msg, '.message>img'

  def navigate(link=nil)
    visit(link)
    #raise "Currently, We have trouble accessing QA Env #{ENV['ENV_ID']}" if goodness_msg.exist
  end

  def hover_myaccounts
    find('.title.my_account_link.mobile_hide').hover
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
          favourite_inactive_btn.click
      when 'Sign out'
        sign_out_btn.click
      when 'Continue'
        new_customer.click
    end
  end

  def click_on_link(link_name)
    footer_link.select { |l| l.text == link_name }.first.click
  end
end


