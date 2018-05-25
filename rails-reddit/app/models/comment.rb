# == Schema Information
#
# Table name: comments
#
#  id         :bigint(8)        not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  post_id    :integer
#  commenter  :string
#

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

end
