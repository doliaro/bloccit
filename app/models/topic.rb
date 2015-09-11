class Topic < ActiveRecord::Base
    has_many :posts

    scope :ordered_by_title, ->{ order('created_at ASC') }

    validates :name, length: { minimum: 5}

    self.per_page = 10
end
