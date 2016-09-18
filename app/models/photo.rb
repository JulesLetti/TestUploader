class Photo < ApplicationRecord

  has_attached_file :image,

                    :styles => {
                      :medium => { :geometry => "640x480", :format => 'flv' },
                      :thumb => { :geometry => "100x100#", :format => 'flv', :time => 10 }}, :processors => [:transcoder],


                  storage: :s3,
                  s3_region: 's3-ap-southeast-2',
                  s3_credentials: {
                    bucket: "testfotosjulia",
                    access_key_id: "AKIAJBJXBX7FWZXDEISA",
                    secret_access_key: "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"
                  }

  validates_attachment :image,
                     content_type: { content_type: ["video/avi", "video/wmv", "video/mng", "video/qt", "video/mp2", "video/mp4" ] },
                     size: { in: 0..5000.kilobytes }
end
