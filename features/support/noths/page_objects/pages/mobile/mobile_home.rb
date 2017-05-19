require 'site_prism'
module Noths
  module PageObjects
    module Pages
      module MobileLoginPage
        class MobileLoginPage < SitePrism::Page
          include Capybara::DSL
          include Poltergeist
          include Mobile

          element :my_accounts, '#accordion-1>a'
          element :my_shopping, '#accordion-2>a'
          element :sign_in_fav, '#favourites-list-sign-in'
          elements :footer_links, '.n-links-list__link'
          element :sign_out, '.n-button.n-button--medium.n-button--secondary'
          element :info_signout, '.message.info.with_icon'

          def click_on_link(link_name)
            if headless?
              footer_links.select { |l| l.text == link_name }.first.trigger('click')
            else
              footer_links.select { |l| l.text == link_name }.first.click
            end
          end

          def click_on(button_name)
            case button_name
              when 'my accounts'
                my_accounts.click
              when 'my shopping'
                my_accounts.click
              when 'signout'
                sign_out.click
            end
          end
        end
      end
    end
  end
end

