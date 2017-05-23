module Helper
  def alert_present?
    begin
      session.driver.browser.switch_to.alert
      puts "Alert present! Switched to alert."
      true
    rescue
      return false
    end
  end

  def chrome?
    return true if Capybara.current_driver == :chrome
  end

end
