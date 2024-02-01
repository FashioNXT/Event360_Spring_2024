module AnalyticsHelper
  def fetch_user_data(api_url)
    users_url = URI::join(api_url, 'users')

    begin
      res = HTTParty.get(users_url)
      JSON.parse(res.body)
    rescue
      {}
    end
  end

  def user_counts(response)
    if response.empty?
      return [].to_json
    end
    if !response.first.has_key?('user_type')
      return [].to_json
    end

    user_types = response.map { |user| user['user_type'] }.compact.uniq
    return [].to_json if user_types.empty?

    user_counts = response.each_with_object(Hash.new(0)) do |user, counts|
      counts[user['user_type']] += 1
    end

    user_types.map do |user_type|
      { user_type: user_type, count: user_counts[user_type] }
    end.to_json
  end


  def active_users_count(response)
    if response.empty?
      return [].to_json
    end
    if !response.first.has_key?('access_enabled')
      return [].to_json
    end

    access_enabled = response.map { |user| user['access_enabled'] }.compact.uniq
    return [].to_json if access_enabled.empty?

    response.each_with_object(Hash.new(0)) do |user, counts|
      counts[user['access_enabled']] += 1
    end.map do |access, count|
      { access_enabled: access, count: count }
    end.to_json
  end

  def user_counts_by_last_access(response)
    if response.empty?
      return [].to_json
    end
    if !response.first.has_key?('last_access') || response.all? { |user| user['last_access'].nil? } || response.all? { |user| user['last_access'] == "null" }
      return [].to_json
    end

    last_access_dates = response.map { |user| user['last_access'] }
    return [].to_json if last_access_dates.empty?

    last_access_dates = response.map { |user| user['last_access'] }
    last_access_dates = last_access_dates.map { |date| date == "null" ? nil : date }
    datetime_format = '%Y-%m-%d'
    parsed_dates = last_access_dates.reject { |date| date.nil? }.map { |date| DateTime.strptime(date, datetime_format) }

    sorted_dates = parsed_dates.sort
    date_counts = Hash.new(0)
    sorted_dates.each do |date|
      date_counts[date.strftime('%Y-%m-%d')] += 1
    end
    date_counts.map { |date, count| { date: date, user_count: count } }.to_json
  end

  def process_fees_for_histogram(response)
    if response.empty?
      return [].to_json
    end
    if !response.first.has_key?('fees_last_30_days')
      return [].to_json
    end

    fees = response.map { |user| user['fees_last_30_days'] }.compact
    return [].to_json if fees.empty?

    if fees.uniq.length <= 4
      return [].to_json
    end

    fees = response.map { |user| user['fees_last_30_days'] }
    
    min_fee = fees.min
    max_fee = fees.max
    
    range = max_fee - min_fee
    bin_size = range / 5.0
    
    bins = Array.new(5, 0)
    
    fees.each do |fee|
      bin_index = ((fee - min_fee) / bin_size).floor.clamp(0, 4)
      bins[bin_index] += 1
    end
    
    histogram_data = bins.each_with_index.map do |count, index|
      {
        range: "#{(min_fee + index * bin_size).round(1)} - #{(min_fee + (index + 1) * bin_size).round(1)}",
        count: count
      }
    end
    
    histogram_data.to_json
  end

  def count_users(response)
    if response.empty?
      user_count = 0
    else
      user_count =  response.size
    end
    return user_count
  end

  def count_unique_locations(response)
    if response.empty?
      return 0
    end
    locations = response.map { |user| user['location'] }.compact.uniq
    return locations.size
  end

  def sum_fees_last_30_days(response)
    if response.empty?
      return 0
    end

    fees_sum = 0
  
    response.each do |user|
      if user["fees_last_30_days"]
        fees_sum += user["fees_last_30_days"]
      end
    end
  
    return fees_sum.round(0)
  end
  
  def count_users_created_last_30_days(response)
    if response.empty?
      return 0
    end

    thirty_days_ago = Date.today - 30
  
    user_count = 0
    response.each do |user|
      if user["created_at"] && Date.parse(user["created_at"]) >= thirty_days_ago
        user_count += 1
      end
    end
  
    return user_count
  end

  def count_active_users(response)
    if response.empty?
      return 0
    end
  
    active_users = response.select { |user| user["access_enabled"] == true }
    return active_users.size
  end
  
  

  def fetch_user_analytics_data(app)
    @response = ""
    api_url = NxtApps.find_by(name: app).api_url

    if api_url
      @response = fetch_user_data(api_url)
      @user_counts_json = user_counts(@response)
      @active_users_count_json = active_users_count(@response)
      @user_counts_by_last_access_json = user_counts_by_last_access(@response)
      @user_fees_distribution_json = process_fees_for_histogram(@response)
      @number_of_users = count_users(@response)
      @number_of_locations = count_unique_locations(@response)
      @total_fees_last_30_days = sum_fees_last_30_days(@response)
      @registrations_30_days = count_users_created_last_30_days(@response)
      @active_user_count = count_active_users(@response)

    else
      flash[:error] = 'API URL not set for this application'
      redirect_to '/'
    end
  end
end
