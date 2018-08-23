require 'date'

module Noths
  module PageObjects
    module Pages
      module ProductPage
        class ProductPage < SitePrism::Page
          include Mobile

          element :favourites_icon, '.favourite_toggle.add_favourite.favourites_heart'
          element :mobile_favourite_icon, '.favourites_buttons.favourites_button_round.favourites_button_round--carousel'

          element :current_product, '.current'
          element :product_title, '.product_title'
          element :product_price, '.currency_GBP'


          element :standard_delivery_msg, '.delivery_message.delivery_message_standard>span'
          element :free_delivery_msg, '.delivery_message.delivery_message_free>span'
          element :express_delivery_msg, '.delivery_message.delivery_message_express_24.mobile_hide'
          element :saturday_delivery_msg, '.delivery_message.delivery_message_saturday.mobile_hide'

          element :product_image, '#image_1'
          element :add_to_cart_btn, "#add_to_cart"

          elements :delivery_dates, '.estimated_delivery_date'

          elements :proceed_to_checkout, '.button.primary.medium.proceed_to_checkout_button'
          element :add_to_basket_button, '#add_to_cart'
          element :checkout_button, '.button.large.primary.checkout'
          elements :continue_button, '#button_continue'

          element :product_detail_tab, '#ga_product_details_tab'
          element :save_for_later_btn, '#save_for_later'
          element :modal_add_to_wish_list_btn, '#modal_add_to_wish_list'
          element :modal_add_to_wedding_list_btn, '#modal_add_to_wedding_list'

          element :paypal_express_checkout_btn, '.button.medium.proceed_to_checkout_with_paypal_express'


          element :survey_popup_close_btn, '.close'


          def click_on_favourites_button
            if mobile?
              wait_until_mobile_favourite_icon_visible(3)
              mobile_favourite_icon.click
            else
              wait_until_favourites_icon_visible(3)
              favourites_icon.click
            end
          end


          def add_to_basket_button
            close_survey_popup
            add_to_basket_button.text.upcase
          end

          def product_image_displayed?
            !product_image[:src].empty?
          end

          def valid_estimate_delivery_date?
            delivery_dates.map {|date| date.text.split(' ')}
          end

          def delivery_price(delivery_type)
            case delivery_type
              when 'standard'
                standard_delivery_msg.text.split(' - ').first
              when 'free'
                free_delivery_msg.text.split(' - ').first
              when 'tracked express'
                express_delivery_msg.text.split(' - ').first
              when 'saturday'
                saturday_delivery_msg.text.split(' - ').first
            end
          end

          def split_estimate_delivery_dates
            est_days = []
            est_dates = []
            est_months = []
            arr = delivery_dates.map {|date| date.text.split(' ')}
            arr.each do |values|
              est_days << values[0]
              est_dates << values[1]
              est_months << values[2]
            end
            [est_days, est_dates, est_months]

          end

          def valid_estimate_delivery_dates?
            delivery_dates = split_estimate_delivery_dates[1].compact
            dates = (1..31).to_a.map(&:to_s)
            delivery_dates.all? {|date| dates.include?(date)}
          end

          def valid_estimate_delivery_days?
            delivery_days = split_estimate_delivery_dates[0].compact
            days = %w[tomorrow Monday Tuesday Wednesday Thursday Friday Saturday Sunday]
            delivery_days.all? {|day| days.include?(day)}
          end

          def valid_estimate_delivery_months?
            delivery_month = split_estimate_delivery_dates[2].compact
            months = Date::MONTHNAMES
            delivery_month.all? {|month| months.include?(month)}
          end

          def add_the_product_to_basket_page_and_do_not_proceed
            close_survey_popup
            add_to_basket_button.click
            close_survey_popup
            checkout_button.click
          end

          def select_paypal_express_checkout
            paypal_express_checkout_btn.click
          end


          def close_survey_popup
            @element_present = page.has_css?('#edr_l_first', wait: 5)
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
