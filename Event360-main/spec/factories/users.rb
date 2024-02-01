FactoryBot.define do
  factory :user do
    name { 'Test User' }
    email { 'test@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
    user_type { 'user' }
    checked_permission { true }
  end

  factory :admin, class: 'User' do
    name { 'Test Admin' }
    email { 'admin@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
    user_type { 'admin' }
    checked_permission { true }
  end
end
