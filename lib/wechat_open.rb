# frozen_string_literal: true
require 'redis'
require 'active_support/all'
WECHAT_OPEN__LIB_PATH = "#{File.dirname(__FILE__)}/wechat_open"
Dir["#{WECHAT_OPEN__LIB_PATH}/api/methods/*.rb", "#{WECHAT_OPEN__LIB_PATH}/token/*.rb"].each { |path| require path }
require_relative "wechat_open/version"
require_relative 'wechat_open/config'
require_relative 'wechat_open/cipher'
require_relative 'wechat_open/api/base'
require_relative 'wechat_open/api/component'
require_relative 'wechat_open/api/authorizer'

module WechatOpen

  API_ENDPOINT = 'https://api.weixin.qq.com/cgi-bin/'.freeze
  APP_AUTHORIZE_ENDPOINT = 'https://mp.weixin.qq.com/cgi-bin/componentloginpage'.freeze

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
      super "(#{code}) #{msg}"
    end
  end
end
