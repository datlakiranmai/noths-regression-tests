# require 'site_prism'
# module Noths
#   module PageObjects
#     module Pages
#       module Registration
#
#
#         class Registration < SitePrism::Page
#           include Capybara::Poltergeist
#           include Poltergeist
#
#           attr_reader :email_address, :password, :first_name, :last_name
#
#           section :sign_up_form, Registration, '#content'
#
#           element :email_field, '#user_email'
#           element :email_confirmation_field, '#user_email_confirmation'
#           element :first_name_field, '#user_first_name'
#           element :last_name_field, '#user_last_name'
#           element :telephone_field, '#user_telephone'
#           element :password_field, '#user_password'
#           element :password_confirm_field, '#user_password_confirmation'
#           element :postcode_field, '#user_default_billing_address_attributes_post_code'
#
#           element :country_code, '#user_telephone_alpha2'
#           element :contact_number_field, '#user_telephone'
#
#           element :country, '#address_new_address_country'
#           element :postcode, '#address_new_address_post_code'
#           element :find_address_link, '.find_address_button.button.secondary.medium'
#           element :choose_address_input, '.choose_address_input'
#           element :choose_address_lists
#           element :address1, '#user_default_billing_address_attributes_address1'
#           element :address2, '#user_default_billing_address_attributes_address2'
#           element :town, '#user_default_billing_address_attributes_town'
#           element :billing_address_county, '#user_default_billing_address_attributes_county'
#           element :enter_address_manually, '.manual_entry_link.medium'
#           element :email_tickbox, '#communication_preference_accepts_email'
#
#           element :check_yourorder_errmsg, ".validate-error.inline-errors.required.last"
#           element :submit_button, '.primary.button.large'
#           element :continue_button, '#button_continue'
#           element :add_address_btn, '#add_address_button'
#           element :guest_user_postcode_field, "#address_new_address_post_code"
#           elements :user_name_display, ".your_details_more_info.summary_info>li"
#           element :existing_customer_signin, "#button_existing_customer"
#
#
#           #error message
#           element :error_title, '.error_messages_title'
#           element :error_message, '.error_message'
#           element :info_message, '.message.info.with_icon>p'
#
#
#           def enter_address_manually
#             address_manual.click
#             address1.set "Flat"
#             address2.set "49 Kew Road"
#             town.set "Richmond"
#           end
#
#           def random_name
#             random_no=SecureRandom.random_number(98765432178634)
#             @random_name ||= random_no+Time.now.to_i
#           end
#
#           def click_on_button(button_name)
#             case button_name
#               when 'Submit'
#                 if headless?
#                   submit_button.click
#                 else
#                   submit_button.click
#                 end
#               when 'Continue'
#                 continue_button.click
#               when 'Add address'
#                 add_address.click
#               when 'Find Address'
#                 find_address_link.click
#               when 'Enter address manually'
#                 enter_address_manually.click
#             end
#           end
#
#           def select_address_from_dropdown
#             choose_address_input.select("Antony Roberts Estate Agents, 3 Kew Road, Richmond")
#           end
#
#           def enter_user_details
#             random_name
#             @email_address = "auth_#{@random_name}@sharklasers.com"
#             wait_until_email_field_visible(30)
#             email_field.set @email_address
#             email_confirmation_field.set @email_address
#             @first_name="first#{@random_name}"
#             @last_name="last#{@random_name}"
#             first_name_field.set @first_name
#             last_name_field.set @last_name
#             @password = "password"
#             password_field.set @password
#             password_confirm_field.set @password
#           end
#
#
#
#           def enter_your_details_in_checkout
#             random_name
#             @email_address="auth_#{@random_name}@sharklasers.com"
#             wait_until_email_field_visible(30)
#             email_field.set @email_address
#             email_confirmation_field.set @email_address
#             @first_name="first#{@random_name}"
#             @last_name="last#{@random_name}"
#             first_name_field.set @first_name
#             last_name_field.set @last_name
#             @password = "password"
#             password_field.set @password
#             password_confirm_field.set @password
#           end
#
#           def enter_email_address_small_cases
#             random_name
#             @email_address = "cognito_#{@random_name}@sharklasers.com"
#             wait_until_email_field_visible(30)
#             email_field.set @email_address
#             email_confirmation_field.set @email_address
#             @first_name="first#{@random_name}"
#             @last_name="last#{@random_name}"
#             first_name_field.set @first_name
#             last_name_field.set @last_name
#             @password = "password"
#             password_field.set @password
#             password_confirm_field.set @password
#           end
#
#           def enter_existing_user_details
#             wait_until_email_field_visible(30)
#             email_field.set @email_address
#             email_confirmation_field.set @email_address
#             @first_name="first#{@random_name}"
#             @last_name="last#{@random_name}"
#             first_name_field.set @first_name
#             last_name_field.set @last_name
#             @password = password
#             password_field.set @password
#             password_confirm_field.set @password
#           end
#
#           def change_country_code(country_name)
#             country_code.select(country_name)
#           end
#
#           def set_contact_number(contact_number)
#             contact_number_field.set contact_number
#           end
#
#           def enter_address_details
#             guest_user_postcode_field.set "TW9 2NQ"
#             find_address_link.click
#             choose_address_input.select("Antony Roberts Estate Agents, 3 Kew Road, Richmond")
#             add_address_btn.click
#           end
#
#           def signin_as_existinguser
#             existing_customer_signin.click
#             email_field.set @email_address
#             password_field.set @password
#           end
#         end
#       end
#     end
#   end
# end
#
#
#
#
require 'site_prism'
require 'rspec/expectations'
require 'capybara/rspec'
module Noths
  module PageObjects
    module Pages
      module Registration

        class Registration < SitePrism::Page
          include Capybara::Poltergeist
          include Poltergeist
          include Capybara::DSL
          include RSpec

          attr_reader :email_address, :password, :first_name, :last_name
          section :sign_up_form, Registration, '#content'

          element :email_field, '#email'
          element :email_confirmation_field, '#confirmEmail'
          element :first_name_field, '#firstName'
          element :last_name_field, '#lastName'
          element :telephone_field, '#user_telephone'
          element :password_field, '#password'
          element :password_confirm_field, '#confirmPassword'
          element :postcode_field, '#user_default_billing_address_attributes_post_code'

          element :country_code, '#user_telephone_alpha2'
          element :contact_number_field, '#user_telephone'

          #legacy
          element :email_field_legacy, '#user_email'
          element :email_confirmation_field_legacy, '#user_email_confirmation'
          element :first_name_field_legacy, '#user_first_name'
          element :last_name_field_legacy, '#user_last_name'
          element :password_field_legacy, '#user_password'
          element :password_confirm_field_legacy, '#user_password_confirmation'


          element :country, '#address_new_address_country'
          element :postcode, '#address_new_address_post_code'
          element :find_address_link, '.find_address_button.button.secondary.medium'
          element :choose_address_input, '.choose_address_input'
          element :choose_address_lists
          element :address1, '#user_default_billing_address_attributes_address1'
          element :address2, '#user_default_billing_address_attributes_address2'
          element :town, '#user_default_billing_address_attributes_town'
          element :billing_address_county, '#user_default_billing_address_attributes_county'
          element :enter_address_manually, '.manual_entry_link.medium'
          element :email_tickbox, '#communication_preference_accepts_email'

          element :check_yourorder_errmsg, ".validate-error.inline-errors.required.last"
          element :submit_button, '.NFC-Button.NFC-Button--large.NFC-Button--fullWidthOnMobile'
          element :submit_button_legacy, '.primary.button.large'
          element :continue_button, '#button_continue'
          element :add_address_btn, '#add_address_button'
          element :guest_user_postcode_field, "#address_new_address_post_code"
          elements :user_name_display, ".your_details_more_info.summary_info>li"
          element :existing_customer_signin, "#button_existing_customer"

          element :secure_password_popup, '.css-dk279f'
          elements :reg_checkboxes, '.css-ru86rt'
          element :privacy_policy_error_msg, '.css-oqhx9n'

          #error message
          element :error_message, '.css-12alag6'
          element :info_message, '.message.info.with_icon>p'

          elements :inline_validations, '.NFC-FormInput__input-error.NFC-FormInput__input-error--small'

          def enter_address_manually
            address_manual.click
            address1.set "Flat"
            address2.set "49 Kew Road"
            town.set "Richmond"
          end

          def user_already_exists_msg
            puts error_message.text
          end

          def random_name
            random_no = SecureRandom.random_number(12343498765432178634787807878)
            @random_name ||= random_no + Time.now.to_i
          end

          def random_name_register_again
            random_no = SecureRandom.random_number(12343498765432178634787807878)
            @random_name_register ||= random_no + Time.now.to_i
          end

          def inline_validation_text
            inline_validations.map {|line| line.text}
          end

          def privacy_policy_msg
            privacy_policy_error_msg.text
          end

          def click_on_button(button_name)
            case button_name
              when 'Submit'
                if headless?
                  submit_button.click
                else
                  submit_button.click
                end
              when 'legacy submit'
                submit_button_legacy.click
              when 'Continue'
                continue_button.click
              when 'Add address'
                add_address.click
              when 'Find Address'
                find_address_link.click
              when 'Enter address manually'
                enter_address_manually.click
            end
          end

          def select_address_from_dropdown
            choose_address_input.select("Antony Roberts Estate Agents, 3 Kew Road, Richmond")
          end

          def enter_user_details
            random_name
            @email_address = "auth_#{@random_name}@sharklasers.com"
            wait_until_email_field_visible(30)
            email_field.set @email_address
            email_confirmation_field.set @email_address
            @first_name = "first#{@random_name}"
            @last_name = "last#{@random_name}"
            first_name_field.set @first_name
            last_name_field.set @last_name
            @password = "password"
            password_field.set @password
            password_confirm_field.set @password
          end


          def register_legacy_user
            random_name
            @email_address= "auth_#{@random_name}@sharklasers.com"
            wait_until_email_field_legacy_visible(30)
            email_field_legacy.set @email_address
            email_confirmation_field_legacy.set @email_address
            @first_name = "first#{@random_name}"
            @last_name = "last#{@random_name}"
            first_name_field_legacy.set @first_name
            last_name_field_legacy.set @last_name
            @password = "password"
            password_field_legacy.set @password
            password_confirm_field_legacy.set @password
          end

          def register_again
            random_name_register_again
            @email_address = "auth_#{@random_name_register}@sharklasers.com"
            wait_until_email_field_visible(30)
            email_field.set @email_address
            email_confirmation_field.set @email_address
            @first_name = "first#{@random_name_register}"
            @last_name = "last#{@random_name_register}"
            first_name_field.set @first_name
            last_name_field.set @last_name
            @password = "password"
            password_field.set @password
            password_confirm_field.set @password
          end

          def enter_mismatched_email
            @first_name = "first#{@random_name}"
            @last_name = "last#{@random_name}"
            first_name_field.set @first_name
            last_name_field.set @last_name
            random_name
            @email_address = "auth_#{@random_name}@sharklasers.com"
            wait_until_email_field_visible(30)
            email_field.set @email_address
            email_confirmation_field.set "invalidemail@gmail.com"
            @password = "password"
            password_field.set @password
            password_confirm_field.set @password
          end

          def enter_short_password
            random_name
            @email_address = "auth_#{@random_name}@sharklasers.com"
            wait_until_email_field_visible(30)
            email_field.set @email_address
            email_confirmation_field.set @email_address
            @first_name = "first#{@random_name}"
            @last_name = "last#{@random_name}"
            first_name_field.set @first_name
            last_name_field.set @last_name
            password_field.set "pass"
            password_confirm_field.set "pass"
          end


          def secure_password_msg
            secure_password_popup.text
          end

          def enter_mismatched_password
            random_name
            @email_address = "auth_#{@random_name}@sharklasers.com"
            wait_until_email_field_visible(30)
            email_field.set @email_address
            email_confirmation_field.set @email_address
            @first_name = "first#{@random_name}"
            @last_name = "last#{@random_name}"
            first_name_field.set @first_name
            last_name_field.set @last_name
            @password="password"
            password_field.set @password
            password_confirm_field.set "passwrdd"
          end

          def enter_short_password
            random_name
            @email_address = "auth_#{@random_name}@sharklasers.com"
            wait_until_email_field_visible(30)
            email_field.set @email_address
            email_confirmation_field.set @email_address
            @first_name = "first#{@random_name}"
            @last_name = "last#{@random_name}"
            first_name_field.set @first_name
            last_name_field.set @last_name
            password_field.set "pass"
            password_confirm_field.set "pass"
          end

          def communication_checkbox(status, type)
            if type == "marketing emails"
              reg_checkboxes[0].click
            else
              reg_checkboxes[1].click
            end
          end

          def check_privacy_policy_checkbox
            reg_checkboxes[2].click
          end

          def verify_checkbox_status(checkbox_name)
            sleep 1
            if checkbox_name == "marketing emails"
              reg_checkboxes[0][:'data-checkbox'] == "true" ? true : false
            elsif checkbox_name == "direct post"
              reg_checkboxes[1][:'data-checkbox'] == "true" ? true : false
            elsif checkbox_name == "privacy policy"
              reg_checkboxes[2][:'data-checkbox'] == "true" ? true : false
            end
          end

          def enter_your_details_in_checkout
            random_name
            @email_address = "auth_#{@random_name}@sharklasers.com"
            wait_until_email_field_visible(30)
            email_field.set @email_address
            email_confirmation_field.set @email_address
            @first_name = "first#{@random_name}"
            @last_name = "last#{@random_name}"
            first_name_field.set @first_name
            last_name_field.set @last_name
            @password = "password"
            password_field.set @password
            password_confirm_field.set @password
            reg_checkboxes.last.click
          end

          def enter_email_address_small_cases
            random_name
            @email_address = "cognito_#{@random_name}@sharklasers.com"
            wait_until_email_field_visible(30)
            email_field.set @email_address
            email_confirmation_field.set @email_address
            @first_name = "first#{@random_name}"
            @last_name = "last#{@random_name}"
            first_name_field.set @first_name
            last_name_field.set @last_name
            @password = "password"
            password_field.set @password
            password_confirm_field.set @password
          end

          def enter_existing_user_details
            wait_until_email_field_visible(30)
            email_field.set @email_address
            email_confirmation_field.set @email_address
            @first_name = "first#{@random_name}"
            @last_name = "last#{@random_name}"
            first_name_field.set @first_name
            last_name_field.set @last_name
            @password = password
            password_field.set @password
            password_confirm_field.set @password
          end

          def change_country_code(country_name)
            country_code.select(country_name)
          end

          def set_contact_number(contact_number)
            contact_number_field.set contact_number
          end

          def enter_address_details
            guest_user_postcode_field.set "TW9 2NQ"
            find_address_link.click
            choose_address_input.select("Antony Roberts Estate Agents, 3 Kew Road, Richmond")
            add_address_btn.click
          end

          def signin_as_existinguser
            existing_customer_signin.click
            email_field.set @email_address
            password_field.set @password
          end

        end
      end
    end
  end
end
