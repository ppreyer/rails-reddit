# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  vote_id         :integer
#

class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :votes
  has_many :liked_posts, through: :votes, class_name: 'Post'
  has_many :books_to_read, through: :checkouts, class_name: 'Book'
  has_secure_password

  def to_s
    username
  end
end
