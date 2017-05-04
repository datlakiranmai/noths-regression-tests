require 'capybara'

class Payment < SitePrism::Page

  element :payment_option, '#payment_medium_payment_form_credit_card'
  element :credit_card_type, '#checkout_credit_card_type'
  element :credit_card_number, '#checkout_credit_card_number'
  element :credit_card_name , '#checkout_credit_card_name'
  element :credit_card_expiry_month, '#checkout_credit_card_expiry_month'
  element :credit_card_expiry_year, '#checkout_credit_card_expiry_year'
  element :card_verification_value, '#checkout_credit_card_verification_value'
  element :skip_3d_secure, '#checkout_skip_3d_secure'
  element :payment_button, '#process_payment_button'

  def select_card_type
    payment_option.click
  end

  def submit_payment
    credit_card_type.select 'Visa Debit or Electron'
    credit_card_number.set '4111111111111111'
    credit_card_name.set 'Hans Peter Luhn'
    credit_card_expiry_month.select '8'
    credit_card_expiry_year.select '2018'
    card_verification_value.set '737'
    skip_3d_secure.click
    payment_button.click
  end
end