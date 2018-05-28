# == Schema Information
#
# Table name: votes
#
#  id         :bigint(8)        not null, primary key
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Vote < ApplicationRecord
  belongs_to :post
  belongs_to :user, optional: true
end
