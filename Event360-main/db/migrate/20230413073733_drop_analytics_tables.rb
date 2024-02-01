class DropAnalyticsTables < ActiveRecord::Migration[6.1]
  def change
    drop_table :active_analytics_views_per_days
    drop_table :ahoy_events
    drop_table :ahoy_visits
    # Also drop companies table
    drop_table :companies
  end
end
