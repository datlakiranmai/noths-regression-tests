require 'site_prism'
module Noths
  module PageObjects
    module Pages
      module MyOrders
        class MyOrders < SitePrism::Page
          include Poltergeist

          element :gift_voucher_code, '.item_options>li>a'
          elements :my_orders_options, '.gc-header-myaccount__link'

          attr_reader :voucher_code

          def check_voucher_code
            @voucher_code = gift_voucher_code.text
          end

          def click_on_myorders
            wait_until_my_orders_options_visible(30)
            sleep 1
            my_orders_options.select {|option| option.text == "my orders"}.first.click
          end

        end
      end
    end
  end
end
