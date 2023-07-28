# @author anthony
# @date  2023/7/28
module WechatOpen
  module Api
    module Methods
      module Component

        def authorizer_url(redirect_uri, auth_type="1")
          "#{APP_AUTHORIZE_ENDPOINT}?component_appid=#{component_appid}&pre_auth_code=#{api_create_preauthcode}&redirect_uri=#{redirect_uri}&auth_type=#{auth_type}"
        end
        def api_create_preauthcode
          result = post 'component/api_create_preauthcode', { component_appid: component_appid }
          return result.pre_auth_code if result.success?
        end
        def api_authorizer_token(authorizer_appid, authorizer_refresh_token)
          post 'component/api_authorizer_token', {component_appid: component_appid, authorizer_appid: authorizer_appid, authorizer_refresh_token: authorizer_refresh_token }
        end

        def api_query_auth(authorization_code)
          post 'component/api_query_auth', { component_appid: component_appid,  authorization_code: authorization_code }
        end

        def api_get_authorizer_list
          post "component/api_get_authorizer_list?access_token=#{access_token}"
        end

        def api_get_authorizer_info(authorizer_appid)
          post "component/api_get_authorizer_info?access_token=#{access_token}", { component_appid: component_appid, authorizer_appid: authorizer_appid }
        end

      end
    end
  end
end
