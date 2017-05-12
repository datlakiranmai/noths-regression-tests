require 'site_prism'
module Noths
  module PageObjects
    module Pages
      module OrderConfirmation
        class OrderConfirmation < SitePrism::Page
          element :order_completed_status, '.module_title.checkout_information_title'
          element :title_order_completed, '.section_title'
          element :thank_you_for_order, '.page_title>span'
        end
      end
    end
  end
end
