require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_firefox

  Capybara.register_driver :headless_firefox do |app|
    options = Selenium::WebDriver::Firefox::Options.new(args: ['-headless'])
    Capybara::Selenium::Driver.new(app, browser: :firefox, options: options)
  end
end
