require 'site_prism'
module Noths
  module PageObjects
    module Pages
      module MyDetails

        class MyDetails < SitePrism::Page
          include Poltergeist

          attr_reader :my_details_address, :new_password

          element :my_details_page, '.page_title'
          elements :my_details_options, '.gc-header-myaccount__link'
          elements :my_details_accounts_options, '.dep.links>li>a'
          element :my_details_address, '#user_email'
          element :current_password, '#user_password_for_authentication'
          element :new_password_field, '#user_password'
          element :confirm_new_password, '#user_password_confirmation'
          element :submit_button, '.primary.button.large'

          element :details_updated, '.message.alert.with_icon>p'

          def click_on(button_name)
            if headless?
              my_details_options.select { |option| option.text == button_name }.first.trigger("click")
            else
              wait_until_my_details_options_visible(20)
              my_details_options.select { |option| option.text == button_name }.first.click
            end

          end


          def change_password(current_pwd)
            @new_password="newcognitopassword"
            current_password.set current_pwd
            new_password_field.set @new_password
            confirm_new_password.set @new_password
            submit_button.click
          end

          def click_on_link(link_name)
            if headless?
              my_details_accounts_options.select { |option| option.text == link_name }.first.trigger("click")
            else
              wait_until_my_details_accounts_options_visible(20)
              my_details_accounts_options.select { |option| option.text == link_name }.first.click
            end
          end

          def check_page_name(pagename)
            if headless?
              page.driver.save_screenshot('screenshot/page_title.png', :full => true)
              try_until(30) { my_details_page.text.eql?(pagename.upcase) }
            end
          end
        end
      end
    end
  end
end