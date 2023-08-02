# @author anthony
# @date  2023/8/2
module WechatOpen
  module Api
    module Methods
      module Kf

        def customservice_kfaccount_add(kf_account, nickname, password)
          post 'customservice/kfaccount/add', {
            kf_account: kf_account,
            nickname: nickname,
            password: password
          }
        end

        def customservice_kfaccount_update(kf_account, nickname, password)
          post 'customservice/kfaccount/update', {
            kf_account: kf_account,
            nickname: nickname,
            password: password
          }
        end

        def customservice_kfaccount_del(kf_account)
          post 'customservice_kfaccount_del', {
            kf_account: kf_account
          }
        end

        def text_message_send(touser:, content:)
          message_custom_send(touser, 'text', { text: { content: content } })
        end

        def image_message_send(touser:, media_id:)
          message_custom_send(touser, 'image', { image: { media_id: media_id } })
        end

        def voice_message_send(touser:, media_id:)
          message_custom_send(touser, 'voice', { voice: { media_id: media_id } })
        end

        def video_message_send(touser:, video: {})
          message_custom_send(touser, 'vodeo', { video: video })
        end

        def music_message_send(touser, music: {})
          message_custom_send(touser, 'music', { music: music })
        end

        def news_message_send(touser:, news: [] )
          message_custom_send(touser, 'news', { news: { articles: news  } })
        end

        private

        def message_custom_send(touser, msgtype, payload = {})
          payload[:touser] = touser
          payload[:msgtype] = msgtype
          post 'message/custom/send', payload
        end

      end
    end
  end
end
