require 'site_prism'
module Noths
  module PageObjects
    module Pages
      module AddToBasket
        class AddToBasket < SitePrism::Page
          include Poltergeist
          include Helper
          elements :proceed_to_checkout, '.button.primary.medium.proceed_to_checkout_button'
          element :add_to_basket_button, '#add_to_cart'
          element :checkout_button, '.button.large.primary.checkout'
          elements :continue_button, '#button_continue'

          element :survey_popup_close_btn, '.close'

          def add_the_product_to_basket_page_and_do_not_proceed
            if headless?
              if alert_present?
                try_until(20) { page.accept_confirm { add_to_basket_button.click } }
              else
                try_until(20) { add_to_basket_button.click }
              end
            else
              add_to_basket_button.click
            end
            if alert_present?
              page.accept_confirm { checkout_button.click }
            else
              checkout_button.click if headless? || chrome?
            end
          end

          def close_survey_popup
            @element_present= page.has_css?('#edr_l_first',wait: 5)
            if @element_present
              within_frame(find('#edr_l_first')) do
                survey_popup_close_btn.click
              end
            end
          end


          def add_the_product_in_basket
            close_survey_popup
            add_to_basket_button.click
            close_survey_popup
            checkout_button.click
            proceed_to_checkout.first.click
          end
        end
      end
    end
  end
end