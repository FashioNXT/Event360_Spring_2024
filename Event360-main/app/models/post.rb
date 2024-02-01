class Post < ApplicationRecord
    validates :title, presence: true
    validates_presence_of :recipient
    validates_presence_of :title
    validates_presence_of :content
    mount_uploader :image, ImageUploader

    alias_attribute :application_id, :oauth_applications_id
    
    def to_s
      title
    end
  end