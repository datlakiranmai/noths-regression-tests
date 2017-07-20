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

  def retry_on_readtimeout(link)
    begin
      tries ||= 3
      visit(link)
    rescue Net::ReadTimeout
      retry unless (tries -= 1).zero?
    end
  end

end
