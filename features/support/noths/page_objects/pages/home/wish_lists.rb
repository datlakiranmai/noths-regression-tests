module Noths
  module PageObjects
    module Pages
      module Wishlist

        class Wishlist < SitePrism::Page

          elements :buttons, '.button.primary.medium'

          def click_on(button_name)
            buttons.select { |b| b.text==button_name.upcase }.first.click
          end
        end
      end
    end
  end
end