module Noths
  module PageObjects
    module Pages
      module SearchPage
        class SearchPage < SitePrism::Page

          element :search_page, '.page_title.search_title'

          element :category_title, '.page_title>span'

          elements :checkboxes, '.checkbox_label'

          elements :free_delivery_label, '.free_delivery'

          elements :product_images, '.product_image.has_product_image_gravity'

          elements :search_count, '#page_index>span'

          elements :product_details, '.product_details'

          elements :current_GBP, '.currency_GBP'

          def search_page?
            page.has_css?('.page_title.search_title')
          end

          def searched_products_count
            wait_until_product_images_visible(30)
            product_images.count
          end

          def free_delivery_labels_count
            wait_until_free_delivery_label_visible(30)
            free_delivery_label.count
          end

          def no_of_search_items
            search_count.first.text.gsub("1 to ", "")
          end

          def select_search_option(search_option)
            checkboxes.select { |label| label.text == search_option }.first.click
          end

          def product_title_displayed?
            !product_details.any? {|title| title.text.empty? }
          end

          def product_images_displayed?
            !product_images.any? {|images| images[:src].empty? }
          end

          def price_tags_displayed?
            !current_GBP.any? { |price| price.text.empty? }
          end

        end
      end
    end
  end
end