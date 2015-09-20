class Post < ActiveRecord::Base
    has_many :comments
    belongs_to :user

    default_scope { order('created_at DESC')}

    scope :ordered_by_title, -> { reorder(title: :asc) }
    scope :ordered_by_reverse_created_at, -> { reorder('created_at DESC')}

#scope :ordered_by_title, -> { reorder(title: :asc) }
#scope :ordered_by_reverse_created_at, -> { reorder('created_at').reverse_order }


#scope :ordered_by_title, -> { reorder('title') }
#scope :ordered_by_reverse_created_at, -> { reorder('created_at ASC') }

#scope :ordered_by_title, -> { order('posts.title ASC') }
#scope :ordered_by_reverse_created_at, -> { order('posts.created_at DESC') }

#scope :ordered_by_title, -> { order('title ASC') }
#scope :ordered_by_reverse_created_at, -> { order('created_at ASC')}


# ArgumentError: Direction "esc" is invalid. Valid directions are: [:asc, :desc, :ASC, :DESC, "asc", "desc", "ASC", "DESC"]

end



