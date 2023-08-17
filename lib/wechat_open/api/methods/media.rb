# @author anthony
# @date  2023/7/31
# @desc 媒体管理
module WechatOpen
  module Api
    module Methods
      module Media

        def media_upload(type, file)
          post_file 'media/upload', file, params: { type: type }
        end

        def media_get(media_id)
          get 'media/get', params: { media_id: media_id }, as: :file
        end

        def get_media_url(media_id)
          "#{API_ENDPOINT}media/get?access_token=#{access_token}&media_id=#{media_id}"
        end

      end
    end
  end
end
