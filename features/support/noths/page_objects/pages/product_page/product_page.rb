module Noths
  module PageObjects
    module Pages
      module ProductPage
        class ProductPage < SitePrism::Page
          include Mobile
          include Poltergeist

          element :favourites_icon, '.favourite_toggle.add_favourite.favourites_heart'

          def click_on_favourites_button
            wait_until_favourites_icon_visible(3)
            favourites_icon.click
          end

        end
      end
    end
  end
end
