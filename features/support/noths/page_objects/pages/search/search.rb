module Noths
  module PageObjects
    module Pages
      module SearchPage
        class SearchPage < SitePrism::Page
          include Poltergeist

          element :search_page, '.page_title.search_title'

          element :category_title, '.page_title>span'

          def search_page?
            page.has_css?('.page_title.search_title')
          end
        end
      end
    end
  end
end