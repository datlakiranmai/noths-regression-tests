require 'capybara'
module Noths
  module PageObjects
    module Pages
      module Payment
        class Payment < SitePrism::Page
          include Poltergeist

          element :payment_option, '#payment_medium_payment_form_credit_card'
          element :credit_card_type, '#checkout_credit_card_type'
          element :credit_card_number, '#checkout_credit_card_number'
          element :credit_card_name, '#checkout_credit_card_name'
          element :credit_card_expiry_month, '#checkout_credit_card_expiry_month'
          element :credit_card_expiry_year, '#checkout_credit_card_expiry_year'
          element :card_verification_value, '#checkout_credit_card_verification_value'
          element :skip_3d_secure, '#checkout_skip_3d_secure'
          element :payment_button, '#process_payment_button'
          element :paypal_payment_option, '#payment_medium_payment_form_paypal'
          element :paypal_section, '.hideable_form_section.js_hide.billing.paypal'

          element :apply_voucher, '#apply_voucher'

          element :voucher_code_toggler, '.voucher_codes_toggler'

          element :giftcard_voucher_field, '#voucher_code_field'
          element :giftcard_voucher_pin, '#voucher_pin_field'

          element :enter_voucher_code, '#check_voucher'

          element :username, '#username'
          element :password, '#password'
          element :submit_button, '.button.paySubmit'


          def apply_voucher_code(voucher_code)
            giftcard_voucher_field.set voucher_code
          element :username, 'input#username'
          element :password, '#password'
          element :submit_button, '.button.paySubmit'
            end

          def apply_voucher_code
            giftcard_voucher_field.set "603628613282002252376"
            giftcard_voucher_pin.set "8090"
            enter_voucher_code.click
            sleep 0.5
            apply_voucher.click
          end

          def select_card_type
            payment_option.click
          end

          def payment_option?
            try_until(15) { @payment_option = has_payment_option? }
            @payment_option
          end

          def select_voucher_code
            voucher_code_toggler.click
          end

          def select_paypal
            wait_until_paypal_payment_option_visible(10)
            paypal_payment_option.click
            sleep 2
            payment_button.click
          end

          def credit_card_type?
            try_until(15) { @credit_card_type = has_credit_card_type? }
            @credit_card_type
          end

          def secure_payment
            within_frame "three_d_iframe" do
              wait_until_username_visible(10)
              username.set 'user'
              password.set 'password'
              submit_button.click
              sleep 2
            end
          end

          def submit_payment(card_type)
            case card_type
              when 'VisaDebit'
                #credit_card_type.select 'Visa Debit or Electron'
                credit_card_number.set '4111111111111111'
                card_verification_value.set '737'
              when 'MasterCard5X'
                #credit_card_type.select 'MasterCard'
                credit_card_number.set '5555 4444 3333 1111'
                card_verification_value.set '737'
              when 'MasterCard2X'
                #credit_card_type.select 'MasterCard'
                credit_card_number.set '2223 0000 4841 0010'
                card_verification_value.set '737'
              when 'Visa'
                #credit_card_type.select 'Visa'
                credit_card_number.set '4400 0000 0000 0008'
                card_verification_value.set '737'
              when 'AmericanExpress'
                #credit_card_type.select 'American Express'
                credit_card_number.set '3700 0000 0000 002'
                card_verification_value.set '7373'
              when '3DSecure'
                credit_card_number.set '4212 3456 7890 1237'
                card_verification_value.set '737'
            end
            credit_card_name.set 'Hans Peter Luhn'
            credit_card_expiry_month.select '10'
            credit_card_expiry_year.select '2020'
            #skip_3d_secure.click
            payment_button.click
          end
        end
      end
    end
  end
end
