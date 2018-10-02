module Noths
  module PageObjects
    module Pages
      module FavouritesPage
        class FavouritesPage < SitePrism::Page
          include Mobile
          include Poltergeist


          def favourites_page_title
            page.find("h1[class^='styles__Text-']").text
          end

          def click_on_product_image
            element = page.find("img[src$='/preview_tallulah-gold-distressed-table.jpg']")
            element.click
          end

          def click_on_create_new_folder
            page.find("img[src$='/folder-icon-add.svg']").click
          end

        end
      end
    end
  end
end
