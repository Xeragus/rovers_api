# frozen_string_literal: true

require 'redis'

class Cache
  def initialize(host = :localhost)
    @redis = Redis.new(host: host)
  end

  def set(key, value, expire_in_seconds:)
    @redis.setex(key, expire_in_seconds, value)
  end

  def get(key)
    @redis.get(key)
  end

  def exists?(key)
    @redis.exists?(key)
  end
end