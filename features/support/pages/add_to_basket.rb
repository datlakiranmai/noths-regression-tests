require 'site_prism'

class AddToBasket < SitePrism::Page
  include Poltergeist
  elements :proceed_to_checkout, '.button.primary.medium.proceed_to_checkout_button'
  element :add_to_basket_button, '#add_to_cart'
  element :checkout_button, '.button.large.primary.checkout'
  elements :continue_button, '#button_continue'

  def add_the_product_in_basket
    if headless?
      try_until(20) { add_to_basket_button.click }
   else
    add_to_basket_button.click
    end
    checkout_button.click
    proceed_to_checkout.first.click
  end
end

