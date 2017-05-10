class Gift_Voucher < SitePrism::Page
  include Poltergeist

  elements :voucher_amount, '.amount-fields.input>label'
  element :gift_card_to, '#gift_card_to'
  element :gift_card_from, '#gift_card_from'
  element :card_email, '#gift_card_email'
  element :add_to_cart_button, '#add_to_cart'

  element :terms_and_condition, '#read_terms_conditions'
  elements :checkout_and_subscribe_button, '.submit.button.base.primary.medium'

  def enter_gift_voucher_form
    if headless?
      sleep 10
         voucher_amount.first.trigger("click")
    else
      voucher_amount.first.click
    end
    gift_card_to.set 'automation user 01'
    gift_card_from.set 'automation user 02'
    card_email.set 'giftvoucher01@sharklasers.com'
    add_to_cart_button.click
  end

  def checkout
    terms_and_condition.click
    checkout_and_subscribe_button.first.click
  end
end