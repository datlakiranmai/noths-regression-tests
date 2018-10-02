module Noths
  module PageObjects
    module Pages
      module PaypalPage
        class PaypalPage < SitePrism::Page
          include Helper
          include Poltergeist

          element :continue_btn, '#confirmButtonTop'
          element :preloader_spinner, '#preloaderSpinner'

          element :email, "#email"
          element :password, "#password"
          element :signin_button, '#btnLogin'

          element :login, '.btn.full.ng-binding'

          element :next_button, :id, 'btnNext'

          def paypal_signin_page?
            try_until(40) { @email = has_email? }
            @email
          end

          def paypal_signin
            wait_until_preloader_spinner_invisible(120)
            #within_frame "injectedUl" do
            login.click
            sleep 5
            email.set Configuration.instance.username('paypal')
            next_button.click
            sleep 1
            password.set Configuration.instance.password('paypal')
            signin_button.click
            #end
          end

          def wait_for_paypal_page
            sleep 2
            wait_for_preloader_spinner(30)
          end

          def continue
            wait_until_continue_btn_visible(60)
            page.execute_script("document.querySelector('#confirmButtonTop').click();")
            sleep 3
            #page.execute_script("document.querySelector('#confirmButtonTop').click();")
          end
        end
      end
    end
  end
end