class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :content, presence: true, length: { minimum: 10 }
  validates :status, presence: true, inclusion: { in: ['draft', 'published'] }
  
  # Default scope to show published posts first
  default_scope { order(created_at: :desc) }
  
  # Status methods
  def draft?
    status == 'draft'
  end
  
  def published?
    status == 'published'
  end
  
  # Word count helper
  def word_count
    content.split.size
  end
end
