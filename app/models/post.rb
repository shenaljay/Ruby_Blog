class Post < ApplicationRecord
  has_many :comments
  belongs_to :group

  def self.search(search)
    if search
      where(["name LIKE ?", "%#{params[:search]}"])
    else
      Post.all
    end
  end
end
