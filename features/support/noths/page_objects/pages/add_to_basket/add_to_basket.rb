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

          element :product_detail_tab, '#ga_product_details_tab'
          element :save_for_later_btn, '#save_for_later'
          element :modal_add_to_wish_list_btn, '#modal_add_to_wish_list'
          element :modal_add_to_wedding_list_btn, '#modal_add_to_wedding_list'


          element :survey_popup_close_btn, '.close'

          def add_the_product_to_basket_page_and_do_not_proceed
            close_survey_popup
            add_to_basket_button.click
            close_survey_popup
            checkout_button.click
          end

          def close_survey_popup
            @element_present= page.has_css?('#edr_l_first', wait: 5)
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

          def add_the_product_to_wishlist
            product_detail_tab.click
            save_for_later_btn.click
            modal_add_to_wish_list_btn.click
          end


          def add_the_product_to_weddinglist
            product_detail_tab.click
            save_for_later_btn.click
            modal_add_to_wedding_list_btn.click
          end

          def click_on(option)
            case option
              when 'product detail tab'
                product_detail_tab.click
              when 'save for later'
                save_for_later_btn.click
              when 'add to wish list'
                modal_add_to_wish_list_btn.click
              when 'add to wedding list'
                modal_add_to_wedding_list_btn.click
            end
          end
        end
      end
    end
  end
end

