module Noths
  module PageObjects
    class Application
      def initialize
        @pages = {}
      end

      def home
        @pages[:home] ||= Noths::PageObjects::Pages::HomePage::HomePage.new
      end

      def my_details
        @pages[:mydetails_page] ||= Noths::PageObjects::Pages::MyDetails::MyDetails.new
      end

      def login
        @pages[:signin_page] ||= Noths::PageObjects::Pages::LoginPage::LoginPage.new
      end

      def registration
        @pages[:signup_page] ||= Noths::PageObjects::Pages::Registration::Registration.new
      end

      def payment
        @pages[:payment] ||= Noths::PageObjects::Pages::Payment::Payment.new
      end

      def your_order
        @pages[:your_order] ||= Noths::PageObjects::Pages::YourOrder::YourOrder.new
      end

      def gift_voucher
        @pages[:gift_voucher] ||= Noths::PageObjects::Pages::Gift_Voucher::Gift_Voucher.new
      end

      def add_to_basket
        @pages[:add_to_basket] ||= Noths::PageObjects::Pages::AddToBasket::AddToBasket.new
      end

      def wishlist
        @pages[:wishlist] ||= Noths::PageObjects::Pages::Wishlist::Wishlist.new
      end

      def order_confirmation
        @pages[:order_confirmation] ||= Noths::PageObjects::Pages::OrderConfirmation::OrderConfirmation.new
      end

      def mobile
        @pages[:mobile_new_user_features] ||= Noths::PageObjects::Pages::MobileLoginPage::MobileLoginPage.new
      end
    end
  end
end