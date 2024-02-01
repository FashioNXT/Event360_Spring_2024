require 'rails_helper'
require_relative '../../app/helpers/analytics_helper'

RSpec.describe AnalyticsController, type: :controller do
  describe 'GET #index' do
    context 'when response is present' do
      let(:response) do
        [
          { 'access_enabled' => true, 'last_access' => '2021-01-01', 'user_type' => 'admin', 'fees_last_30_days' => 10},
          { 'access_enabled' => true, 'last_access' => '2021-01-02', 'user_type' => 'admin', 'fees_last_30_days' => 20},
          { 'access_enabled' => true, 'last_access' => '2021-01-02', 'user_type' => 'regular', 'fees_last_30_days' => 30},
          { 'access_enabled' => false, 'last_access' => '2021-01-03', 'user_type' => 'regular', 'fees_last_30_days' => 40},
          { 'access_enabled' => false, 'last_access' => '2021-01-03', 'user_type' => 'regular', 'fees_last_30_days' => 50}
        ]
      end

      let(:response_nils) do
        [
          { 'access_enabled' => nil, 'last_access' => nil, 'user_type' => nil, 'fees_last_30_days' => nil},
          { 'access_enabled' => nil, 'last_access' => nil, 'user_type' => nil, 'fees_last_30_days' => nil},
          { 'access_enabled' => nil, 'last_access' => nil, 'user_type' => nil, 'fees_last_30_days' => nil},
          { 'access_enabled' => nil, 'last_access' => nil, 'user_type' => nil, 'fees_last_30_days' => nil},
          { 'access_enabled' => nil, 'last_access' => nil, 'user_type' => nil, 'fees_last_30_days' => nil}
        ]
      end

      let(:response_nulls) do
        [
          { 'access_enabled' => true, 'last_access' => "null", 'user_type' => 'admin', 'fees_last_30_days' => 10},
          { 'access_enabled' => true, 'last_access' => "null", 'user_type' => 'admin', 'fees_last_30_days' => 20},
          { 'access_enabled' => true, 'last_access' => "null", 'user_type' => 'regular', 'fees_last_30_days' => 30},
          { 'access_enabled' => false, 'last_access' => "null", 'user_type' => 'regular', 'fees_last_30_days' => 40},
          { 'access_enabled' => false, 'last_access' => "null", 'user_type' => 'regular', 'fees_last_30_days' => 50}
        ]
      end

      before do
        allow(controller).to receive(:fetch_user_analytics_data).and_return(response)
      end

      describe '#user_counts' do
        context 'when data is present' do
          it 'returns the correct data' do
            expected_result = [{ user_type: 'admin', count: 2 }, { user_type: 'regular', count: 3 }].to_json
            result = controller.helpers.user_counts(response)
            expect(result).to eq(expected_result)
          end
        end

        context 'when data is nil' do
          it 'returns an empty array' do
            expected_result = "[]"
            result = controller.helpers.user_counts(response_nils)
            expect(result).to eq(expected_result)
          end
        end
      end

      describe '#active_users_count' do
        context 'when data is present' do
          it 'returns the correct data' do
            expected_result = [{ access_enabled: true, count: 3 }, { access_enabled: false, count: 2 }].to_json
            result = controller.helpers.active_users_count(response)
            expect(result).to eq(expected_result)
          end
        end

        context 'when data is nil' do
          it 'returns an empty array' do
            expected_result = "[]"
            result = controller.helpers.active_users_count(response_nils)
            expect(result).to eq(expected_result)
          end
        end
      end

      describe '#user_counts_by_last_access' do
        context 'when data is present' do
          it 'returns the correct data' do
            expected_result = [
              { date: '2021-01-01', user_count: 1 },
              { date: '2021-01-02', user_count: 2 },
              { date: '2021-01-03', user_count: 2 }
            ].to_json
            result = controller.helpers.user_counts_by_last_access(response)
            expect(result).to eq(expected_result)
          end
        end

        context 'when data is nil' do
          it 'returns an empty array' do
            expected_result = "[]"
            result = controller.helpers.user_counts_by_last_access(response_nils)
            expect(result).to eq(expected_result)
          end
        end

        context 'when data is null' do
          it 'returns an empty array' do
            expected_result = "[]"
            result = controller.helpers.user_counts_by_last_access(response_nulls)
            expect(result).to eq(expected_result)
          end
        end
      end

      describe '#user_counts_by_last_access' do
        context 'when data is present' do
          it 'returns the correct histogram data' do
            expected_result = [
              { range: '10.0 - 18.0', count: 1 },
              { range: '18.0 - 26.0', count: 1 },
              { range: '26.0 - 34.0', count: 1 },
              { range: '34.0 - 42.0', count: 1 },
              { range: '42.0 - 50.0', count: 1 }
            ].to_json
            result = controller.helpers.process_fees_for_histogram(response)
            expect(result).to eq(expected_result)
          end
        end

        context 'when data is nil' do
          it 'returns an empty array' do
            expected_result = "[]"
            result = controller.helpers.process_fees_for_histogram(response_nils)
            expect(result).to eq(expected_result)
          end
        end
      end

      let(:empty_response) { [] }
      # Get current date and subtract a random number of days between 1 to 29 days to get some random dates
      def random_date_last_month 
        (Date.today - rand(1..29)).strftime("%Y-%m-%d")
      end

      def random_date_over_month
        (Date.today - rand(32..100)).strftime("%Y-%m-%d")
      end

      let(:response_with_users) { [
        { "id" => 1, "location" => "New York", "fees_last_30_days" => 100, "created_at" => random_date_last_month, "access_enabled" => true },
        { "id" => 2, "location" => "Los Angeles", "fees_last_30_days" => nil, "created_at" => random_date_last_month, "access_enabled" => true },
        { "id" => 3, "location" => nil, "fees_last_30_days" => 50, "created_at" => random_date_over_month, "access_enabled" => false },
        { "id" => 4, "location" => "New York", "fees_last_30_days" => 75, "created_at" => random_date_over_month, "access_enabled" => true },
        { "id" => 5, "location" => "Chicago", "fees_last_30_days" => 200, "created_at" => random_date_last_month, "access_enabled" => true },
        { "id" => 6, "location" => "New York", "fees_last_30_days" => 50, "created_at" => random_date_over_month, "access_enabled" => true }
      ]}

      describe "#count_users" do
        context "when given an empty response" do
          it "returns 0" do
            result = controller.helpers.count_users(empty_response)
            expect(result).to eq(0)
          end
        end
        
        context "when given a response with users" do
          it "returns the correct number of users in the response" do
            result = controller.helpers.count_users(response_with_users)
            expect(result).to eq(6)
          end
        end
      end


      describe "#count_unique_locations" do
        it "returns 0 when given an empty response" do
          result = controller.helpers.count_unique_locations(empty_response)
          expect(result).to eq(0)
        end

        it "returns the correct number of unique locations in the response" do
          result = controller.helpers.count_unique_locations(response_with_users)
          expect(result).to eq(3)
        end
      end

      describe "#sum_fees_last_30_days" do
        it "returns 0 when given an empty response" do
          result = controller.helpers.sum_fees_last_30_days(empty_response)
          expect(result).to eq(0)
        end

        it "returns the correct sum of fees for users in the last 30 days" do
          result = controller.helpers.sum_fees_last_30_days(response_with_users)
          expect(result).to eq(475)
        end
      end

      describe "#count_users_created_last_30_days" do
        it "returns 0 when given an empty response" do
          result = controller.helpers.count_users_created_last_30_days(empty_response)
          expect(result).to eq(0)
        end

        it "returns the correct number of users created in the last 30 days" do
          result = controller.helpers.count_users_created_last_30_days(response_with_users)
          expect(result).to eq(3)
        end
      end

      describe "#count_active_users" do
        it "returns 0 when given an empty response" do
          result = controller.helpers.count_active_users(empty_response)
          expect(result).to eq(0)
        end

        it "returns the correct number of active users in the response" do
          result = controller.helpers.count_active_users(response_with_users)
          expect(result).to eq(5)
        end
      end

    end
  end
end
