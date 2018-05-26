# == Schema Information
#
# Table name: downvotes
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#

class Downvote < ApplicationRecord
  belongs_to :post
end
