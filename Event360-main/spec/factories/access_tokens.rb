FactoryBot.define do
  factory :access_token, class: 'Doorkeeper::AccessToken' do
    resource_owner_id { create(:user).id }
    application { create(:doorkeeper_application) }
    expires_in { 2.hours }
  end
end
