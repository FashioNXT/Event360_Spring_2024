FactoryBot.define do
  factory :doorkeeper_application, class: 'NxtApps' do
    sequence(:name) { |n| "Test App #{n}" }
    description { 'Test description' }
    redirect_uri { 'https://example.com/callback' }
    scopes { 'read' }
    confidential { true }
    api_url { 'https://api.example.com' }
    image_url { 'https://example.com/image.png' }
    homepage_url { 'https://example.com' }
  end
end
