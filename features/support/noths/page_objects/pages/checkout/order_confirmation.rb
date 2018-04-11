require 'site_prism'
module Noths
  module PageObjects
    module Pages
      module OrderConfirmation
        class OrderConfirmation < SitePrism::Page
          include Mobile
          include Poltergeist
          element :order_completed_status, '.module_title.checkout_information_title'
          element :title_order_completed, '.section_title'
          element :thank_you_for_order, '.page_title>span'
          element :mention_me_popup, '#mmCloseButton'

          def handle_mm_popup
            try_until(30) { @element_present= page.has_css?('#mmContentRegister') }
            if @element_present
              within_frame(find('#mmContentRegister')) do
                mention_me_popup.click
              end
            end
          end

          def title_order_completed?
            try_until(20) { @title_order_completed=has_title_order_completed? }
            @title_order_completed
          end
        end
      end
    end
  end
end
