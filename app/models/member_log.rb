# == Schema Information
#
# Table name: dbo.MemberLog
#
#  ID          :integer          not null, primary key
#  Phone       :string(20)
#  Context     :string(500)
#  CreateTime  :datetime
#  ContextType :integer
#

class MemberLog < ActiveRecord::Base
end
