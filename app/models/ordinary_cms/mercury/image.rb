module OrdinaryCms
  module Mercury
    class Image
      include Mongoid::Document
      include Mongoid::Paperclip

      has_mongoid_attached_file :image


      validates_presence_of :image
      validates_attachment_content_type :attachment, content_type: %w(image/jpg image/jpeg image/png)

      delegate :url, :to => :image

      def serializable_hash(options = nil)
        options ||= {}
        options[:methods] ||= []
        options[:methods] << :url
        super(options)
      end
    end
  end
end