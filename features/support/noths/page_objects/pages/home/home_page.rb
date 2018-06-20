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
          include Helper

          elements :header_buttons, '.gc-header-myaccount__link.gc-header-myaccount__link--inline'
          element :signed_in_user, '.gc-header-myaccount__trigger.logged-in>span'
          element :favourite_btn, '.gc-header-favourites.gc-header__item.gc-header__item--favourites'
          elements :footer_link, '.gc-links-list__link'
          elements :sign_out_btn, '.gc-button.gc-button--secondary.gc-header-myaccount__sign-out'
          elements :banner_img, '.desktop_only.desktop_banner'
          element :forgotten_password_link, '.css-1f8a1tj'

          element :search_field, '#term'
          element :find_button, '.gc-button.gc-button--medium.gc-button--primary.gc-form__field.gc-form__field--submit'

          #favourites
          element :favourites_page_title, '.favourites_intro_header'

          #Welcome Screen
          element :page_title, '.css-1fysquf'
          element :info, '.message.info.with_icon'
          elements :new_customer, '.NFC-Button.NFC-Button--medium'
          element :sign_up_link, '#sign_up_link'

          #legacy_page_title
          element :legacy_page_title, '.page_title'

          #mobile
          elements :mobile_buttons, 'a.gc-button.gc-button--medium.gc-button--primary.gc-button--full-width'
          element :signin_checkout, '.button.primary.large.existing_mobile_customer_link'

          #admin
          elements :site_features, '#new_feature'
          element :cms_sign_out, '#ext-gen161'



          def navigate(link=nil)
            retry_on_readtimeout(link)
          end

          def user_logged_in?
            return true if page.has_css?('.gc-header-myaccount__trigger.logged-in>span',wait:15)
          end

          def navigate_to_admin
            retry_on_readtimeout('admin/session/new')
          end

          def navigate_to_site_features
            retry_on_readtimeout('admin/features')
          end

          def enter_search_text(search_text)
            search_field.set search_text
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
              retry_on_readtimeout('admin#home')
              cms_sign_out.click
            end
          end

          def turn_rollback_flag(flag_status)
            usecognito= all('#new_feature').select { |l| l[:action].include? 'use_cognito_rollback/preview' }
            usecognito[0].find('#new_feature>input').click
            sleep 1
            if mobile?
              page.driver.browser.manage.window.resize_to(1200, 768)
              visit('admin#home')
              cms_sign_out.click
              page.driver.browser.manage.window.resize_to(375, 667)
            else
              retry_on_readtimeout('admin#home')
              cms_sign_out.click
            end
          end


          def favourites_page?
            page.has_css?('.favourites_intro_header')
          end

          def check_cognito_flag(status)
            page_source = page.body
            status == 'ON' ? page_source.include?('"useCognitoAuth":true') : page_source.include?('"useCognitoAuth":false')
          end

          def check_rollback_flag(status)
            page_source = page.body
            status == 'ON' ? page_source.include?('"useCognitoRollback":true') : page_source.include?('"useCognitoRollback":false')
          end

          def hover_myaccounts
            if headless?
              try_until(20) { find('.title.my_account_link.mobile_hide').trigger('click') }
            else
              find('.gc-header-myaccount__trigger.logged-in>span').hover
            end
          end

          def navigate_to_myaccounts
            start_time=Time.now
            begin
              page.find('.gc-header-myaccount__trigger.logged-in>span',wait: 20).click
            rescue Capybara::ElementNotFound
              p "Registartion/Sign In Failure - Redirection Timeout, Waited for #{Time.now-start_time}!"
            end
          end

          def home_page?
            page.has_css?('.desktop_only.desktop_banner')
          end

          def get_desktop_banners_count
            all('.desktop_only.desktop_banner').count
          end

          def click_on(button_name)
            case button_name
              when 'Find'
                find_button.click
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
                  favourite_btn.click
                end
              when 'Favourite SignIn'
                page.find("a[class^='AccountLogin__sign-in']").click
              when 'Favourite Register'
                page.find("a[class^='AccountLogin__register']").click
              when 'Forgotten password'
                forgotten_password_link.click
              when 'Sign out'
                if headless?
                  try_until(20) { sign_out_btn.trigger('click') }
                else
                  wait_until_sign_out_btn_visible(30)
                  sign_out_btn.first.click
                end
              when 'Sign up'
                sign_up_link.click
              when 'Continue'
                new_customer.last.click
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
