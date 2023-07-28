# @author anthony
# @date  2023/7/28
module WechatOpen
  module Api
    module Methods
      module Component
        def api_authorizer_token(component_appid, authorizer_appid, authorizer_refresh_token)
          post 'component/api_authorizer_token', {component_appid: component_appid, authorizer_appid: authorizer_appid, authorizer_refresh_token: authorizer_refresh_token }
        end
      end
    end
  end
end
