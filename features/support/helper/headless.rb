module Poltergeist
  include Capybara::DSL

  def headless?
    return true if Capybara.current_driver == :headless
  end

  def try_until(timeout=30, raise_exception = true, &block)
    start_time=Time.now
    last_error=nil
    until (duration = Time.now - start_time) > timeout
      begin
        yield
        last_error=nil
        return true
      rescue => e
        last_error=e
      end
      sleep 0.01
    end
    raise "Timeout waiting for #{duration} but #{last_error}" if raise_exception
  end
end

