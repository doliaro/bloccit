class Post < ActiveRecord::Base
	has_many :comments
    belongs_to :user
    belongs_to :topic

    scope :ordered_by_title, ->{ order('created_at ASC') }
    scope :ordered_by_reverse_created_at, ->{ order('created_at DESC')}

    default_scope { order('created_at DESC') }
end