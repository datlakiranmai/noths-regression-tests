module Noths
  module PageObjects
    module Pages
      module WeddinglistPage
        class WeddinglistPage < SitePrism::Page
          include Poltergeist

          element :wedding_list_page_title, '.section_title'

          def navigated_to_weddinglist?
            return true if page.has_css?('.section_title')
          end

        end
      end
    end
  end
end