module Noths
  module PageObjects
    module Pages
      module WishlistPage
        class WishlistPage < SitePrism::Page
          include Poltergeist

          element :wish_list_page_title, '.page_title'

          def navigated_to_wish_list_page?
            begin
              wait_until_wish_list_page_title_visible(10)
            rescue SitePrism::TimeOutWaitingForElementVisibility
              false
            end
          end
        end
      end
    end
  end
end