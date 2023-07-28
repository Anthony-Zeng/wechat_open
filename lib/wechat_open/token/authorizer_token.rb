# @author anthony
# @date  2023/7/28
module WechatOpen
  module Token
    class AuthorizerToken < Base

      def redis_key
        @redis_key ||= Digest::MD5.hexdigest "WX_APP_TOKEN_#{client.corp_id}_#{client.secret}"
      end

      def token_key
        'authorizer_access_token'
      end

      def refresh_token
        client.component.api_authorizer_token(client.component.component_appid, client.authorizer_appid, client.authorizer_refresh_token)
      end

    end
  end
end
