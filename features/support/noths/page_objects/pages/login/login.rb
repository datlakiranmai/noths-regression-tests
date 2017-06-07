require 'site_prism'
module Noths
  module PageObjects
    module Pages
      module LoginPage
        class LoginPage < SitePrism::Page

          element :login_email, '#email'
          element :login_pwd, '#password'
          element :signin_button, '#button_existing_customer'


          def signin_credentials(username, password)
            wait_until_login_email_visible(30)
            login_email.set username
            login_pwd.set password
            signin_button.click
          end
        end
      end
    end
  end
end
