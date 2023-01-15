# frozen_string_literal: true

require 'httparty'
require_relative 'cache'

class API
  include HTTParty
  base_uri 'https://api.nasa.gov/mars-photos/api/v1/rovers'

  def initialize(data)
    @rover = data.rover || 'curiosity'
    @options = {
      query: {
        earth_date: data.earth_date || Date.today.strftime('%Y-%m-%d'),
        api_key: ENV['NASA_API_KEY']
      }
    }
    @options[:camera] = data.camera if data.camera
    @earth_date_obj = Date.parse(@options[:query][:earth_date])
    @cache = Cache.new
  end

  def photos(days_count = 10, photos_per_day = 3)
    puts "Loading photos taken between #{@earth_date_obj - 10} and #{@earth_date_obj}..."

    photos = []

    days_count.times do |previous_days_index|
      current_day = @options[:query][:earth_date]
      @earth_date_obj -= previous_days_index
      @options[:query][:earth_date] = @earth_date_obj.strftime('%Y-%m-%d')

      photos << Hash[current_day, @cache.get(current_day).split(' ')] and next if @cache.exists?(current_day)

      day_photos = []

      response = self.class.get("/#{@rover}/photos", @options)

      day_photos << response['photos'].take(photos_per_day).map { |data_obj| data_obj['img_src'] }
      day_photos = day_photos.flatten
      photos << Hash[current_day, day_photos]
      @cache.set(current_day, day_photos.join(' '), expire_in_seconds: 120)
    end

    photos
  end
end
