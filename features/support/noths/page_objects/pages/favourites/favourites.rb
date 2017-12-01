module Noths
  module PageObjects
    module Pages
      module FavouritesPage
        class FavouritesPage < SitePrism::Page
          include Mobile
          include Poltergeist
          element :favourites_page, '.styles__Text-s1v41g03-1.iQbbGd'
          element :product_image, '.styles__Image-s11kzqgc-4.cwrbVz'

          def favourites_page_title
            favourites_page.text
          end

          def click_on_product_image
            wait_until_product_image_visible(3)
            product_image.click
          end
        end
      end
    end
  end
end
