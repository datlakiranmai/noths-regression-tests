module Noths
  module PageObjects
    module Pages
      module PaypalPage
        class PaypalPage < SitePrism::Page
          include Helper

          element :continue_btn, '#confirmButtonTop'
          element :preloader_spinner, '#preloaderSpinner'

          element :email, "#email"
          element :password, "#password"
          element :signin_button, '#btnLogin'

          element :next_button, :id, 'btnNext'

          def paypal_signin
            wait_until_preloader_spinner_invisible(30)
            #within_frame "injectedUl" do
              email.set Configuration.instance.username('paypal')
              next_button.click
              password.set Configuration.instance.password('paypal')
              signin_button.click
            #end
          end

          def wait_for_paypal_page
            wait_for_preloader_spinner(30)
          end

          def continue
            wait_until_continue_btn_visible(30)
            if chrome?
              page.find('#confirmButtonTop').click
            else
              page.execute_script("document.querySelector('#confirmButtonTop').click();")
            end
          end
        end
      end
    end
  end
end