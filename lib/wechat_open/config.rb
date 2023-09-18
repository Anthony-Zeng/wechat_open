# @author anthony
# @date  2023/7/28
module WechatOpen
  class << self
    def configure
      yield config
    end

    def config
      @config ||= Config.new
    end

    def redis
      config.redis
    end

    def http_timeout_options
      config.http_timeout_options || {write: 2, connect: 5, read: 10}
    end

    def expired_shift_seconds
      config.expired_shift_seconds || 100
    end

    def api_base_url
      return @api_base_url if defined?(@api_base_url)

      @api_base_url = config.api_base_url || API_ENDPOINT
    end

  end

  class Config
    attr_accessor :redis, :http_timeout_options, :expired_shift_seconds, :api_base_url
  end
end