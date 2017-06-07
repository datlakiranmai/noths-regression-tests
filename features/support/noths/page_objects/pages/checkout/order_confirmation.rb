require 'site_prism'
module Noths
  module PageObjects
    module Pages
      module OrderConfirmation
        class OrderConfirmation < SitePrism::Page
          include Mobile
          element :order_completed_status, '.module_title.checkout_information_title'
          element :title_order_completed, '.section_title'
          element :thank_you_for_order, '.page_title>span'
          element :mention_me_popup, '#mmCloseButton'

          def mm_popup
            if mobile?

              within_frame(find('#mmContentOffer')) do
                mention_me_popup.click if page.has_css?('#mmCloseButton')
              end
            else
              return
            end
          end
        end
      end
    end
  end
end