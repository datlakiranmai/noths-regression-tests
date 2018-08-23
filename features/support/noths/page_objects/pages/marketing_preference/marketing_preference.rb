require 'site_prism'
module Noths
  module PageObjects
    module Pages
      module MarketingPage
        class MarketingPage < SitePrism::Page
          include Poltergeist


          element :title, '.css-1fysquf'
          elements :subscribe_checkboxes, '.css-ru86rt'
          element :error_messages, '[data-error-panel]'
          elements :my_accounts, '.gc-header-myaccount__link'

          element :info_message, '.css-12alag6'
          element :save_button, '.NFC-Button.NFC-Button--medium.NFC-Button--fullWidthOnMobile'

          def info_text
            info_message.text.downcase
          end


          def save_changes
            save_button.click
          end

          def click_on_my_marketing_preferences
            wait_until_my_accounts_visible(30)
            sleep 1
            my_accounts.select {|option| option.text == "my marketing preferences"}.first.click
          end

        end
      end
    end
  end
end
