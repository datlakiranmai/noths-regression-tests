module Helper
  def alert_present?
    begin
      session.driver.browser.switch_to.alert
      puts "Alert present! Switched to alert."
      true
    rescue
      puts "No alert present."
      return false
    end
  end
end
