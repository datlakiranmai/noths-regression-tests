module Noths
  module PageObjects
    module Pages
      module ForgottenPassword
        class ForgottenPassword < SitePrism::Page

          element :email_field, '#email'
          element :forgotten_password, '.button.primary.large'
          element :inline_validation_error_msg, '.validate-error.inline-errors.required.last'
          element :forgotten_password_notice_msg, '.message.notice.with_icon'


          def enter_email_address(email_address)
            email_field.set email_address
          end

          def click_forgotten_password_button
            forgotten_password.click
          end
        end
      end
    end
  end
end
