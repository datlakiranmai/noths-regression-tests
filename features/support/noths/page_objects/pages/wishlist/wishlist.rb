module Noths
  module PageObjects
    module Pages
      module WishlistPage
        class WishlistPage < SitePrism::Page
          include Poltergeist

          element :wish_list_page_title, '.page_title'

          def navigated_to_wishlist?
            return true if page.has_css?('.page_title')
          end

        end
      end
    end
  end
end