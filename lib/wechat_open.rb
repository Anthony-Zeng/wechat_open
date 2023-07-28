# frozen_string_literal: true
require 'redis'
require 'active_support/all'
LIB_PATH = "#{File.dirname(__FILE__)}/wechat_open"
Dir["#{LIB_PATH}/api/methods/*.rb", "#{LIB_PATH}/token/*.rb"].each { |path| require path }
require_relative "wechat_open/version"
require_relative 'wechat_open/config'

module WechatOpen

  API_ENDPOINT = 'https://api.weixin.qq.com/cgi-bin/'

  HTTP_OK_STATUS          = [200, 201].freeze
  SUCCESS_CODE            = 0
  class RedisNotConfigException < RuntimeError; end
  class AccessTokenExpiredError < RuntimeError; end
  class ResultErrorException < RuntimeError; end
  # Your code goes here...
  class ResponseError < StandardError
    attr_reader :error_code

    def initialize(code, msg = '')
      @error_code = code
      super "(#{error_code}) #{msg}"
    end
  end
end
