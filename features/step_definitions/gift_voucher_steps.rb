And(/^I enter my details in gift voucher form$/) do
  @gift_voucher = Gift_Voucher.new
  @gift_voucher.enter_gift_voucher_form
end

And(/^I checkout gift voucher$/) do
  @gift_voucher.checkout
end