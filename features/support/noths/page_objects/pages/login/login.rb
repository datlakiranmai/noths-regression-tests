# require 'site_prism'
# module Noths
#   module PageObjects
#     module Pages
#       module LoginPage
#         class LoginPage < SitePrism::Page
#
#
#           element :login_email, '#email'
#           element :login_pwd, '#password'
#           element :signin_button, '#button_existing_customer'
#           element :admin_signin_button, '#admin_log_in_button'
#
#           #error_messages
#           element :sign_in_error_msg, '.error_message'
#           element :checkout_sign_in_error_msg, '.message.error.with_icon'
#           element :forgotten_password_info_msg, '.message.info.with_icon'
#           element :noths_employee_security_error_message, '.message.error.with_icon'
#
#           def signin_credentials(username, password)
#             wait_until_login_email_visible(30)
#             login_email.set username
#             login_pwd.set password
#             signin_button.click
#           end
#
#           def signin_failure?
#             page.has_css?('.error_message')
#           end
#
#           def admin_signin_credentials
#             wait_until_login_email_visible(30)
#             login_email.set Configuration.instance.username('admin')
#             login_pwd.set Configuration.instance.password('admin')
#             admin_signin_button.click
#           end
#         end
#       end
#     end
#   end
# end
require 'site_prism'
module Noths
  module PageObjects
    module Pages
      module LoginPage
        class LoginPage < SitePrism::Page
          include Poltergeist

          element :login_email, '#email'
          element :login_pwd, '#password'
          elements :signin_button, '.NFC-Button.NFC-Button--medium'
          element :admin_signin_button, '#admin_log_in_button'

          #error_messages
          element :sign_in_error_msg, '.css-q9x1ep'
          element :checkout_sign_in_error_msg, '.message.error.with_icon'
          element :forgotten_password_info_msg, '.message.info.with_icon'
          element :noths_employee_security_error_message, '.message.error.with_icon'

          element :marketing_pref_popup  ,'.NFC-Button.NFC-Button--medium.css-fa64fk'
          element :signin_title, '.css-1fysquf'


          def check_email_address_case
            login_email.value
          end

          def signin(username,password)
            wait_until_login_email_visible(30)
            login_email.set username
            login_pwd.set password
            signin_button.first.click
          end

          def signin_caps(username,password)
            wait_until_login_email_visible(30)
            login_email.set username
            login_pwd.set password
          end

          def click_signin
            signin_button.first.click
          end

          def handle_marketing_popup
            wait_until_marketing_pref_popup_visible(10)
            marketing_pref_popup.click
          end

          def signin_failure?
            page.has_css?('.error_message')
          end

          def admin_signin_credentials
            wait_until_login_email_visible(30)
            if "#{Configuration.instance.env_id}" == "staging"
              login_email.set Configuration.instance.username('staging-admin')
              login_pwd.set Configuration.instance.password('staging-admin')
            else
              login_email.set Configuration.instance.username('QA-admin')
              login_pwd.set Configuration.instance.password('QA-admin')
            end
            admin_signin_button.click
          end
        end
      end
    end
  end
end

