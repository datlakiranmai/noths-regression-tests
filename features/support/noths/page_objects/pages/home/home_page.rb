require 'site_prism'
require 'rspec/expectations'
require 'nokogiri'

module Noths
  module PageObjects
    module Pages
      module HomePage
        class HomePage < SitePrism::Page
          include Capybara::DSL
          include Poltergeist
          include Mobile

          #element :register_button, '.register_link.last.button_medium_mobile'
          #element :signin_button, '.sign_in_link.button_medium_mobile'
          elements :header_buttons, '.gc-header-myaccount__link.gc-header-myaccount__link--inline'
          element :signed_in_user, '.gc-header-myaccount__trigger.logged-in>span'
          element :favourite_inactive_btn, '.gc-header-favourites.gc-header__item.gc-header__item--favourites'
          elements :footer_link, '.gc-links-list__link'
          elements :sign_out_btn, '.gc-button.gc-button--secondary'
          elements :banner_img, '.desktop_only.desktop_banner'
          element :forgotten_password_link, '.sign_in_forgotten_password.text_link'



          #Welcome Screen
          element :page_title, '.page_title'
          element :info, '.message.info.with_icon'
          element :new_customer, '#button_new_customer'

          #mobile
          elements :mobile_buttons, 'a.gc-button.gc-button--medium.gc-button--primary.gc-button--full-width'
          element :sign_in_fav, '#favourites-list-sign-in'
          element :sign_up_fav, '#favourites-list-register'
          element :signin_checkout, '.button.primary.large.existing_mobile_customer_link'

          #admin
          elements :site_features, '#new_feature'
          element :cms_sign_out, '#ext-gen160'

          def navigate(link=nil)
            begin
              visit(link)
                #raise "We have trouble accessing QA Env. #{ENV['ENV_ID']} might be DEAD!" unless page.has_css?('.sign_in_link.button_medium_mobile')
            rescue Net::ReadTimeout
              retry
            end
            #raise "We have trouble accessing QA Env. #{ENV['ENV_ID']} might be dead!" unless page.has_css?('.sign_in_link.button_medium_mobile')
          end

          def navigate_to_admin
            visit('admin/session/new')
          end

          def navigate_to_site_features
            visit('admin/features')
          end

          def turn_cognito_flag(flag_status)
            usecognito= all('#new_feature').select { |l| l[:action].include? 'use_cognito_auth/preview' }
            usecognito[0].find('#new_feature>input').click
            sleep 1
            if mobile?
              page.driver.browser.manage.window.resize_to(1200, 768)
              visit('admin#home')
              cms_sign_out.click
              page.driver.browser.manage.window.resize_to(375, 667)
            else
              visit('admin#home')
              cms_sign_out.click
            end
          end

          def check_cognito_flag(status)
            page_source = page.body
            status == 'ON' ? page_source.include?('"useCognitoAuth":true') : page_source.include?('"useCognitoAuth":false')
          end

          def hover_myaccounts
            if headless?
              try_until(20) { find('.title.my_account_link.mobile_hide').trigger('click') }
            else
              find('.gc-header-myaccount__trigger.logged-in>span').hover
            end
          end

          def navigate_to_myaccounts
            wait_until_signed_in_user_visible(20)
            signed_in_user.click
          end

          def home_page?
            page.has_css?('.desktop_only.desktop_banner')
          end

          def get_desktop_banners_count
            all('.desktop_only.desktop_banner').count
          end

          def click_on(button_name)
            case button_name
              when 'Register'
                if mobile?
                  sleep 5
                  mobile_buttons.last.click
                else
                  header_buttons.last.click
                end
              when 'Signin'
                if mobile?
                  mobile_buttons.first.click
                else
                  header_buttons.first.click
                end
              when 'Favourite'
                if headless?
                  page.driver.click(1731.5, 73)
                else
                  favourite_inactive_btn.click
                end
              when 'Favourite SignIn'
                sign_in_fav.click
              when 'Favourite Register'
                sign_up_fav.click
              when 'Forgotten password'
                forgotten_password_link.click
              when 'Sign out'
                if headless?
                  try_until(20) { sign_out_btn.trigger('click') }
                else
                  wait_until_sign_out_btn_visible(20)
                  sign_out_btn.first.click
                end
              when 'Continue'
                new_customer.click
            end
          end

          def click_on_link(link_name)
            if headless?
              footer_link.select { |l| l.text == link_name }.first.trigger('click')
            else
              footer_link.select { |l| l.text == link_name }.first.click
            end
          end
        end

      end
    end
  end
end
