# @author anthony
# @date  2023/7/28

module WechatOpen
  module Api
    class Component < Base

      include WechatOpen::Cipher
      include Methods::Component

      attr_reader :encoding_aes_key, :component_appid, :component_appsecret, :component_token, :token

      def initialize(options = {})
        @component_appid = options.delete(:component_appid)
        @component_appsecret = options.delete(:component_appsecret)
        @token = @component_token = options.delete(:component_token)
        @encoding_aes_key = options.delete(:encoding_aes_key)
        super(options)
      end

      def component_verify_ticket=ticket
        WechatOpen.redis.set(ticket_key, ticket)
      end

      def component_verify_ticket
        WechatOpen.redis.get(ticket_key)
      end

      def authorizer(authorizer_appid, authorizer_refresh_token)
        WechatOpen::Api::Authorizer.new(component: self, authorizer_appid: authorizer_appid, authorizer_refresh_token: authorizer_refresh_token)
      end

      private

      def token_params
        { component_access_token: access_token }
      end

      def ticket_key
        "COMPONENT_VERIFY_TICKET_#{component_appid}"
      end

      def token_store
        @token_store ||= Token::ComponentToken.new(self)
      end

    end
  end
end
