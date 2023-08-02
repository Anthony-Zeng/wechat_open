# @author anthony
# @date  2023/7/28
require 'wechat_open/token/base'
module WechatOpen
  module Token
    class AuthorizerToken < Base

      def redis_key
        @redis_key ||= Digest::MD5.hexdigest "WX_AUTHORIZER_TOKEN_#{client.authorizer_appid}_#{client.authorizer_refresh_token}"
      end

      def token_key
        'authorizer_access_token'
      end

      def refresh_token
        client.component.api_authorizer_token(client.authorizer_appid, client.authorizer_refresh_token)
      end

    end
  end
end
