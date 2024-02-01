class NxtApps < Doorkeeper::Application
  include ::Doorkeeper::Orm::ActiveRecord::Mixins::Application

  validates :api_url, presence: true
  validates :homepage_url, presence: true
end
