require 'site_prism'
module Noths
  module PageObjects
    module Pages
      module MyDetails

        class MyDetails < SitePrism::Page
          include Poltergeist

          attr_reader :my_details_address

          element :my_details_page, '.page_title'
          elements :my_details_options, '.gc-header-myaccount__link'
          elements :my_details_accounts_options, '.dep.links>li>a'
          element :my_details_address, '#user_email'

          def click_on(button_name)
            if headless?
              my_details_options.select { |option| option.text == button_name }.first.trigger("click")
            else
              sleep 2
              my_details_options.select { |option| option.text == button_name }.first.click
            end

          end

          def click_on_link(link_name)
            if headless?
              my_details_accounts_options.select { |option| option.text == link_name }.first.trigger("click")
            else
              sleep 2
              my_details_accounts_options.select { |option| option.text == link_name }.first.click
            end
          end

          def check_page_name(pagename)
            if headless?
              page.driver.save_screenshot('screenshot/page_title.png', :full => true)
              try_until(30) { my_details_page.text.eql?(pagename.upcase) }
            end
          end
        end
      end
    end
  end
end