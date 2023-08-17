# @author anthony
# @date  2023/7/31
# @desc 公众号
module WechatOpen
  module Api
    module Methods
      module Mp

        def clear_quota(app_id)
          post "clear_quota", { appid: app_id }
        end

      end
    end
  end
end
