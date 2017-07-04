module Noths
  module PageObjects
    module Pages
      module YourOrder
        class YourOrder < SitePrism::Page
          include Poltergeist
          elements :continue_button, '#button_continue'
          element :delivery_recipient, '.delivery_recipient_name'
          element :delivery_addressline1, '.address1.address_line'
          elements :summary_your_details, '.your_details_more_info.summary_info>li'
          elements :summary_your_delivery, '.your_delivery_summary_info.summary_info>li'

          def click_continue_btn
            sleep 3
            continue_button.first.click
          end

          def summary_user_name
            summary_your_details.first.text
          end

          def summary_user_email_address
            summary_your_details.last.text
          end

          def summary_delivery_recipient_name
            "to: #{summary_your_delivery[0].text}"
          end

          def summary_delivery_address
            summary_your_delivery[1].text
          end
        end
      end
    end
  end
end

