require 'site_prism'
module Noths
  module PageObjects
    module Pages
      module LoginPage
        class LoginPage < SitePrism::Page
          include Configuration

          element :login_email, '#email'
          element :login_pwd, '#password'
          element :signin_button, '#button_existing_customer'
          element :admin_signin_button, '#admin_log_in_button'

          #error_messages
          element :sign_in_error_msg, '.error_message'
          element :checkout_sign_in_error_msg, '.message.error.with_icon'
          element :forgotten_password_info_msg, '.message.info.with_icon'
          element :noths_employee_security_error_message, '.message.error.with_icon'

          def signin_credentials(username, password)
            wait_until_login_email_visible(30)
            login_email.set username
            login_pwd.set password
            signin_button.click
          end

          def signin_failure?
            page.has_css?('.error_message')
          end

          def admin_signin_credentials
            get_admin_credentials
            wait_until_login_email_visible(30)
            login_email.set admin_username
            login_pwd.set admin_password
            admin_signin_button.click
          end
        end
      end
    end
  end
end
