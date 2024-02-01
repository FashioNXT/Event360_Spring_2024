class EmailTemplate < ApplicationRecord
    validates :title, uniqueness: {message: "is already taken."}
    validates_presence_of :title
    validates_presence_of :content

    alias_attribute :application_id, :oauth_applications_id
end