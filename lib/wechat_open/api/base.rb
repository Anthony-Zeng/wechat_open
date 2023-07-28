# @author anthony
# @date  2023/7/28

require 'wechat_open/request'
module WechatOpen
  module Api
    class Base


      def request
        @request ||= WechatOpen::Request.new(API_ENDPOINT, false)
      end

      def valid?

      end


      def get(path, headers = {})
        with_token(headers[:params]) do |params|
          request.get path, headers.merge(params: params)
        end
      end

      def post(path, payload, headers = {})
        with_token(headers[:params]) do |params|
          request.post path, payload, headers.merge(params: params)
        end
      end

      def post_file(path, file, headers = {})
        with_token(headers[:params]) do |params|
          request.post_file path, file, headers.merge(params: params)
        end
      end

      def access_token
        token_store.token
      end

      private

      def with_token(params = {}, tries = 2)
        params ||= {}
        yield(params.merge(token_params))
      rescue AccessTokenExpiredError
        token_store.update_token
        retry unless (tries -= 1).zero?
      end

      def token_store
        raise NotImplementedError
      end

      def token_params
        {access_token: access_token}
      end


    end
  end
end
