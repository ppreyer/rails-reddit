# == Schema Information
#
# Table name: downvotes
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#

require 'test_helper'

class DownvoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
