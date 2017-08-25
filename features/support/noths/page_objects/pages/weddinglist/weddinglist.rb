module Noths
  module PageObjects
    module Pages
      module WeddinglistPage
        class WeddinglistPage < SitePrism::Page
          include Poltergeist

          element :wedding_list_page_title, '.section_title'

          def navigated_to_wedding_list_page?
            begin
              wait_until_wedding_list_page_title_visible(10)
            rescue SitePrism::TimeOutWaitingForElementVisibility
              false
            end
          end
        end
      end
    end
  end
end