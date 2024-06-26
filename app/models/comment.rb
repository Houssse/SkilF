class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article, inverse_of: :comments
  belongs_to :parent, optional: true, class_name: 'Comment', inverse_of: :comments

  has_many :comments, foreign_key: :parent_id, dependent: :destroy, inverse_of: :parent
end
