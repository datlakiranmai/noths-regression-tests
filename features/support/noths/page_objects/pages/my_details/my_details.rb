require 'site_prism'
module Noths
  module PageObjects
    module Pages
      module MyDetails

        class MyDetails < SitePrism::Page
          include Poltergeist

          attr_reader :my_details_address, :new_password, :new_email_address

          element :my_details_page, '.page_title'
          elements :my_details_options, '.gc-header-myaccount__link'
          elements :my_details_accounts_options, '.dep.links>li>a'
          element :my_details_address, '#user_email'
          element :current_password, '#user_password_for_authentication'
          element :new_password_field, '#user_password'
          element :confirm_new_password, '#user_password_confirmation'
          element :submit_button, '.primary.button.large'

          element :details_updated, '.message.alert.with_icon>p'

          element :my_details_country_code, '#user_telephone_alpha2'

          element :value_too_short_validation_msg, '.validate-error.inline-errors.minlength.last'
          element :value_mismatch_validation_msg, '.validate-error.inline-errors.matches.last'
          element :error_message_title, '.error_messages_title'
          element :error_message, '.error_message'


          def random_new_email
            a=[('a'..'z'),('A'..'Z')].map(&:to_a).flatten
            @new_email_address="auth_"+(0..20).map{ a[rand(a.length)]}.join+"@sharklasers.com"
          end

          def click_on(button_name)
            if headless?
              my_details_options.select { |option| option.text == button_name }.first.trigger("click")
            else
              wait_until_my_details_options_visible(30)
              my_details_options.select { |option| option.text == button_name }.first.click
            end
          end


          def selected_country_code
            my_details_country_code.find('option[selected]').text.downcase
          end


          def change_password(current_pwd)
            @new_password="newcognitopassword"
            current_password.set current_pwd
            new_password_field.set @new_password
            confirm_new_password.set @new_password
          end


          def change_email_address
            random_new_email
            my_details_address.set @new_email_address
          end


          def click_submit
            submit_button.click
          end

          def enter_new_password(password)
            new_password_field.set password
          end

          def enter_confirm_password(password)
            confirm_new_password.set password
          end

          def change_only_current_password(current_pwd)
            current_password.set current_pwd
          end

          def click_on_link(link_name)
            if headless?
              my_details_accounts_options.select { |option| option.text == link_name }.first.trigger("click")
            else
              wait_until_my_details_accounts_options_visible(30)
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