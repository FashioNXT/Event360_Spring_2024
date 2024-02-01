# Start the ChromeDriver server and then run test:system to run the tests
#
begin
  namespace :test do
    desc "Run system tests"
    task :systest do
      system "chromedriver &"
      system "bundle exec rails test:system"
      # Kill the ChromeDriver server
      system "pkill chromedriver"
    end
  end
end