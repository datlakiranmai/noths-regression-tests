module Mobile
  include Capybara::DSL

  def mobile?
    return true if Capybara.current_driver == :mobile
  end

  end