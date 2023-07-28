# @author anthony
# @date  2023/7/28
require 'wechat_open/token/base'
module WechatOpen
  module Token
    class ComponentToken < Base

      def redis_key
        @redis_key ||= Digest::MD5.hexdigest("WX_COMPONENT_TOKEN_#{client.component_appid}_#{client.component_appsecret}_#{client.component_token}")
      end

      def token_key
        "component_access_token"
      end

      def refresh_token
        client.request.post 'component/api_component_token', { component_appid: client.component_appid, component_appsecret: client.component_appsecret, component_verify_ticket: client.component_verify_ticket }
      end
    end

  end
end
