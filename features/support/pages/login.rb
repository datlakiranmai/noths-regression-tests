require 'site_prism'

class LoginPage < SitePrism::Page

  element :login_email, '#email'
  element :login_pwd, '#password'
  element :signin_button, '#button_existing_customer'


  def signin_credentials(username,password)
    login_email.set username
    login_pwd.set password
    signin_button.click
  end
end
