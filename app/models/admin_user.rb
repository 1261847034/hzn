# == Schema Information
#
# Table name: dbo.AdminUsers
#
#  AdminUserID :integer          not null, primary key
#  LoginName   :string(50)
#  Password    :string(128)
#  Name        :string(20)
#  Phone       :string(20)
#  CreateTime  :datetime
#  RoleId      :integer          default(0)
#  IsHighest   :integer          default(0)
#  Status      :integer          default(0)
#  Sex         :string(10)
#  MacID       :string(50)
#  IP          :string(50)
#  LIP         :string(50)
#  CpuID       :string(50)
#  LandTime    :datetime
#

class AdminUser < ActiveRecord::Base

  validates :LoginName, presence: true

  acts_as_enum :IsHighest, in: [
    ['highest',  1, '最高权限'],
    ['other', 2, '其它权限']
  ]

  acts_as_enum :Status, in: [
    ['disable',  0, '停用'],
    ['available', 1, '在用']
  ]

end
