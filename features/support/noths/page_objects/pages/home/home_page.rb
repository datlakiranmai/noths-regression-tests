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

          element :register_button, '.register_link.last.button_medium_mobile'
          element :signin_button, '.sign_in_link.button_medium_mobile'
          #element :signed_in_user, '.title.my_account_link.mobile_hide'
          element :signed_in_user, '.title_container.my_account_title'
          element :favourite_inactive_btn, '#favourites_heart_inactive'
          elements :footer_link, '.n-links-list__link'
          element :sign_out_btn, '.cta_button.sign_out_button.submit.button.secondary.medium'
          elements :banner_img, '.desktop_only.desktop_banner'


          #Welcome Screen
          element :page_title, '.page_title'
          element :info, '.message.info.with_icon'
          element :new_customer, '#button_new_customer'

          #mobile
          elements :mobile_buttons, '.n-button.n-button--medium.n-button--primary.n-button--full-width'
          element :sign_in_fav, '#favourites-list-sign-in'
          element :sign_up_fav, '#favourites-list-register'
          element :signin_checkout, '.button.primary.large.existing_mobile_customer_link'


          #admin
          elements :site_features, '#new_feature'
          element :cms_sign_out, '#ext-gen160'

          def navigate(link=nil)
            begin
<<<<<<< HEAD
              visit(link)
              raise "We have trouble accessing QA Env. #{ENV['ENV_ID']} might be DEAD!" unless page.has_css?('.sign_in_link.button_medium_mobile')
=======
                visit(link)
>>>>>>> master
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
            usecognito= all('#new_feature').select {|l| l[:action].include? 'use_cognito_auth/preview'}
            usecognito[0].find('#new_feature>input').click
            sleep 1
            visit('admin#home')
            cms_sign_out.click
          end

          def check_cognito_flag(status)
            page_source = page.body
            status == 'ON' ? page_source.include?('"useCognitoAuth":true') : page_source.include?('"useCognitoAuth":false')
          end

          def hover_myaccounts
            if headless?
              try_until(20) { find('.title.my_account_link.mobile_hide').trigger('click') }
            else
              find('.title.my_account_link.mobile_hide').hover
            end
          end

          def navigate_to_myaccounts
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
                  mobile_buttons.last.click
                else
                  register_button.click
                end
              when 'Signin'
                if mobile?
                  mobile_buttons.first.click
                else
                  signin_button.click
                end
              when 'Favourite'
                if headless?
                  page.driver.click(1731.5, 73)
                else
                  favourite_inactive_btn.click
                end
              when 'Favourites SignIn'
                sign_in_fav.click
              when 'Favourite Register'
                sign_up_fav.click
              when 'Sign out'
                if headless?
                  try_until(20) { sign_out_btn.trigger('click') }
                else
                  sign_out_btn.click
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
