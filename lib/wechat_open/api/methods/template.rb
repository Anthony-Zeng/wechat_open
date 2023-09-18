# @author anthony
# @date  2023/9/18
# @desc
module WechatOpen
  module Api
    module Methods
      module Template

        def api_set_industry(industry_id1, industry_id2)
          post 'template/api_set_industry', {
            industry_id1: industry_id1,
            industry_id2: industry_id2
          }
        end

        def get_industry
          get 'template/get_industry'
        end

        def api_add_template(template_id_short:, keyword_name_list:)
          post 'template/api_add_template', {
            template_id_short: template_id_short,
            keyword_name_list: keyword_name_list
          }
        end

        def get_all_private_template
          get 'template/get_all_private_template'
        end

        def del_private_template(template_id)
          post 'template/del_private_template', {
            template_id: template_id
          }
        end

        def send_template_message(touser:, template_id:, data:, url: nil, miniprogram: nil, client_msg_id: nil)
          post 'message/template/send', {
            touser:,
            template_id:,
            url: url,
            miniprogram: miniprogram,
            client_msg_id: client_msg_id,
            data: data
          }.compact
        end

      end
    end
  end
end
