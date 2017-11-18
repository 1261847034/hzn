# == Schema Information
#
# Table name: dbo.Member
#
#  MemberID       :integer          not null, primary key
#  Name           :string(20)
#  Sex            :string(8)
#  HeadIcon       :string(500)
#  Tel            :string(20)
#  Password       :string(100)
#  Province       :string(50)
#  City           :string(50)
#  County         :string(50)
#  CountyID       :integer
#  Address        :string(200)
#  Balance        :decimal(18, 2)   default(0.0)
#  Frozen         :integer          default(0)
#  CreateTime     :datetime
#  Birthday       :datetime
#  Credit         :integer          default(0)
#  IsDisable      :integer
#  Phone          :string(20)
#  Roles          :integer
#  Authentication :integer          default(0)
#  AuthentRoles   :integer
#  BJZ            :decimal(18, 2)   default(0.0)
#  Reason         :string(500)
#  PayPWD         :string(128)
#

class Member < ActiveRecord::Base

  validates :Phone, :Password, :Province, :City, :County, :Roles, presence: true
  validates :Phone, uniqueness: true, if: proc {|m| m.Phone.present? }

  after_validation :create_member_log
  after_create :create_member_log

  enum Sex: {
    male: '男',
    female: '女'
  }

  enum IsDisable: {
    disable: 0,
    available: 1
  }

  enum Roles: {
    shipper: 1,
    driver: 2
  }

  enum Authentication: {
    unauthorized: 0,
    on_authorized: 1,
    authorized: 2,
    authorized_failed: 3
  }

  enum AuthentRoles: {
    auth_shipper: 1,
    entity_driver: 2,
    business_driver: 3
  }

  private

  def create_member_log
    if self.persisted?
      role_name = I18n.t("enums.member.Roles.#{self.Roles}")
      MemberLog.create(Phone: self.Phone, Context: "注册成功，地址为：#{self.Province}#{self.City}#{self.County}';用户角色为：#{role_name}", CreateTime: Time.now, ContextType: 1)
    else
      return unless self.errors.added?(:Phone, :taken)
      MemberLog.create(Phone: self.Phone, Context: '手机号已注册，不能重复注册', CreateTime: Time.now, ContextType: 2)
    end
  end

end
