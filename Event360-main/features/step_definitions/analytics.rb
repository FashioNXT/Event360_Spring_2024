Given("I am on the {string} page") do |page|
    visit page
end

Then("I should see {string} as the header") do |header_text|
    expect(page).to have_css('h1.pg-title', text: header_text)
end

Then("I should see a pie chart") do
    expect(page).to have_css('div.chart-container canvas#pieChart')
end
  
Then("I should see a bar chart") do
    expect(page).to have_css('div.chart-container canvas#barChart')
end
  
Then("I should see a line chart") do
    expect(page).to have_css('div.chart-container canvas#lineChart')
end

Then("I should see a histogram chart") do
    expect(page).to have_css('div.chart-container canvas#histogramChart')
end

Then("I should see chart selectors") do
    expect(page).to have_selector("#pieChart")
    expect(page).to have_selector("#barChart")
    expect(page).to have_selector("#lineChart")
    expect(page).to have_selector("#histogramChart")
end
