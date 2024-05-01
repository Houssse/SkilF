class Article < ApplicationRecord
  belongs_to :user

  has_rich_text :content

  validates :title, presence: true, length: {minimum: 3, maximum: 30}
  validates :content, presence: true, length: {minimum: 3}

  def formatted_created_at
    created_at.strftime('%Y-%m-%d %H:%M:%S')
  end
end
