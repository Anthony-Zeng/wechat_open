# @author anthony
# @date  2023/7/28
module WechatOpen
  module Api
    class Authorizer < Base

      attr_reader :component, :permanent_code

      def initialize(options = {})
        @component = options.delete(:component)
        @authorizer_appid = options.delete(:authorizer_appid)
        @authorizer_refresh_token = options.delete(:authorizer_refresh_token)
        super(options)
      end

      def

      private
        def token_store
          @token_store ||= Token::AuthorizerToken.new(self)
        end

      end
    end
  end

end
