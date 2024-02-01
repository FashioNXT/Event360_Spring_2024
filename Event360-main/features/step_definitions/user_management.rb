names = ["PlaNXT", "EventNXT", "CastNXT"]
names.each do |name|
    Given(/^I am on the \/app\/#{name}\/admin\/index page$/) do
        visit "/app/#{name}/admin/index"
    end
end
Then("I should see a table with the following columns:") do |table|
    expected_columns = table.raw.flatten

    # Get all table header elements
    header_elements = page.all('table th')

    # Check that each expected column is present in the header
    expected_columns.each do |column_name|
        expect(header_elements.any? { |header| header.text == column_name }).to be_truthy
    end
end

Then("I should see {string} heading on the page") do |heading|
    expect(page).to have_css("h1", text: heading)
end
