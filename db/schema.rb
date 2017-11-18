# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "AdminUserPower", primary_key: "ID", force: true do |t|
    t.integer "Pid"
    t.string  "PowerName", limit: 50
  end

  create_table "AdminUserRoleAuthoritys", primary_key: "ID", force: true do |t|
    t.integer "RoleId"
    t.binary  "AuthorityId", limit: 50
  end

  create_table "AdminUserRoles", primary_key: "RoleID", force: true do |t|
    t.string   "RoleName",   limit: 20
    t.datetime "CreateTime"
    t.string   "Remark",     limit: 200
    t.string   "RolePower",  limit: 50
  end

  create_table "AdminUsers", primary_key: "AdminUserID", force: true do |t|
    t.string   "LoginName",  limit: 50
    t.string   "Password",   limit: 128
    t.string   "Name",       limit: 20
    t.string   "Phone",      limit: 20
    t.datetime "CreateTime"
    t.integer  "RoleId",                 default: 0
    t.integer  "IsHighest",              default: 0
    t.integer  "Status",                 default: 0
    t.string   "Sex",        limit: 10
    t.string   "MacID",      limit: 50
    t.string   "IP",         limit: 50
    t.string   "LIP",        limit: 50
    t.string   "CpuID",      limit: 50
    t.datetime "LandTime"
  end

  create_table "Advertisings", primary_key: "ID", force: true do |t|
    t.integer "AdvertisingType"
    t.string  "Img",             limit: 100
    t.string  "Url",             limit: 100
    t.integer "AIndex"
    t.boolean "IsEnable"
    t.string  "Title",           limit: 100
  end

  create_table "Applaylnvoice", primary_key: "ApplaylnvoiceNO", force: true do |t|
    t.integer  "UserID"
    t.decimal  "LnvoiceAmount",              precision: 18, scale: 2
    t.string   "Orders",        limit: 2000
    t.string   "Company",       limit: 100
    t.string   "RatepayingNO",  limit: 50
    t.string   "Address",       limit: 100
    t.string   "LinkName",      limit: 20
    t.string   "LinkPhone",     limit: 20
    t.datetime "CreateTime"
    t.integer  "TheDrawer"
    t.string   "TrackNumber",   limit: 50
    t.string   "TrackCompany",  limit: 50
    t.integer  "Status"
    t.boolean  "IsPost"
    t.boolean  "IsPower"
    t.string   "MailBox",       limit: 50
    t.datetime "DrawerTime"
  end

  create_table "Articles", primary_key: "ID", force: true do |t|
    t.integer  "ArticleType"
    t.string   "Title",          limit: 100
    t.string   "ArticleContent", limit: 4000
    t.datetime "CreateTime"
    t.integer  "UserType"
  end

  create_table "ArticlesType", primary_key: "ID", force: true do |t|
    t.string "TypeName", limit: 50
  end

  create_table "Bail", primary_key: "ID", force: true do |t|
    t.integer  "MemberID",                            null: false
    t.decimal  "Amount",     precision: 18, scale: 2
    t.datetime "CreateTime"
    t.integer  "Status"
  end

  create_table "Bank", primary_key: "Id", force: true do |t|
    t.integer  "BIndex"
    t.string   "BankName",   limit: 50
    t.boolean  "IsEnable",              default: true
    t.datetime "CreateTime"
  end

  create_table "CitysNew", id: false, force: true do |t|
    t.integer "ID"
    t.string  "Name", limit: 25
    t.integer "Pid"
    t.integer "type"
  end

  create_table "ComAuthentication", primary_key: "ID", force: true do |t|
    t.integer  "MemberID"
    t.string   "CorpName",        limit: 20
    t.string   "CorpPhone",       limit: 20
    t.string   "LinkName",        limit: 20
    t.string   "LinkPhone",       limit: 20
    t.string   "ULinkName",       limit: 20
    t.string   "ULinkPhone",      limit: 20
    t.string   "ComName",         limit: 200
    t.string   "BusinessLicence", limit: 50
    t.string   "BLPhoto",         limit: 500
    t.string   "RTNO",            limit: 50
    t.string   "RTNPhoto",        limit: 500
    t.datetime "CreateTime"
    t.datetime "AuditingTime"
    t.string   "ComTel",          limit: 20
    t.integer  "AdminUserID"
  end

  create_table "ComSentAddr", primary_key: "ID", force: true do |t|
    t.integer  "MemberID"
    t.datetime "CreateTime"
    t.string   "Shipper",      limit: 50
    t.string   "ShipperPhone", limit: 20
    t.string   "ShipperAddr",  limit: 100
    t.decimal  "Lat",                      precision: 18, scale: 6
    t.decimal  "Lng",                      precision: 18, scale: 6
  end

  create_table "ComTakeAddr", primary_key: "ID", force: true do |t|
    t.integer  "MemberID"
    t.datetime "CreateTime"
    t.string   "Receipter",    limit: 50
    t.string   "ReceiptPhone", limit: 20
    t.string   "ReceiptAddr",  limit: 100
    t.decimal  "Lat",                      precision: 18, scale: 6
    t.decimal  "Lng",                      precision: 18, scale: 6
  end

  create_table "CommonRoute", primary_key: "ID", force: true do |t|
    t.integer  "MemberID"
    t.string   "StartAddr",  limit: 100
    t.string   "EndAddr",    limit: 100
    t.datetime "CreateTime"
  end

  create_table "DriverAuthentication", primary_key: "ID", force: true do |t|
    t.integer  "MemberID"
    t.string   "MemberName",         limit: 20
    t.string   "IDNumber",           limit: 25
    t.string   "HIDFPhoto",          limit: 500
    t.string   "MTFPhoto",           limit: 500
    t.string   "RTPhoto",            limit: 500
    t.string   "QualificationPhoto", limit: 500
    t.string   "PlateNO",            limit: 50
    t.string   "RoadTransporNO",     limit: 50
    t.string   "QualificationNO",    limit: 50
    t.string   "DLHeadPhoto",        limit: 500
    t.string   "DLHeadNO",           limit: 50
    t.string   "DLTrailerPhoto",     limit: 500
    t.string   "DLTrailerNO",        limit: 50
    t.decimal  "TruckHigh",                      precision: 6, scale: 2
    t.decimal  "TruckLong",                      precision: 6, scale: 2
    t.decimal  "TruckWidth",                     precision: 6, scale: 2
    t.decimal  "MaxPayload",                     precision: 6, scale: 2
    t.integer  "TruckType"
    t.datetime "CreateTime"
    t.datetime "AuditimgTime"
  end

  create_table "GoodsType", primary_key: "ID", force: true do |t|
    t.string   "GoodsTypeName", limit: 50
    t.datetime "CreateTime"
  end

  create_table "GoodsUnit", primary_key: "ID", force: true do |t|
    t.string   "UnitName",   limit: 20
    t.datetime "CreateTime"
  end

  create_table "InComes", primary_key: "IncomeNO", force: true do |t|
    t.integer  "MemberID"
    t.integer  "MemberType"
    t.integer  "IncomeWay"
    t.decimal  "Income",                 precision: 18, scale: 2
    t.datetime "IncomeTime"
    t.integer  "Status"
    t.datetime "AuditTime"
    t.integer  "AuditSatus"
    t.string   "OutID",       limit: 50
    t.integer  "AdminuserID"
  end

  create_table "LoginLockTime", primary_key: "ID", force: true do |t|
    t.string   "LoginName", limit: 50
    t.datetime "LockTime"
  end

  create_table "LoginLog", primary_key: "ID", force: true do |t|
    t.string   "LoginName",    limit: 50
    t.string   "LoginContent", limit: 100
    t.integer  "LoginType"
    t.datetime "CreateTime"
    t.string   "LoginIp",      limit: 50
    t.string   "LoginCPU",     limit: 50
    t.string   "LoginDisk",    limit: 50
    t.string   "LoginMac",     limit: 50
    t.string   "LoginLIp",     limit: 50
  end

  create_table "LoginLogType", id: false, force: true do |t|
    t.integer "ID"
    t.string  "LoginValue", limit: 50
  end

  create_table "Member", primary_key: "MemberID", force: true do |t|
    t.string   "Name",           limit: 20
    t.string   "Sex",            limit: 8
    t.string   "HeadIcon",       limit: 500
    t.string   "Tel",            limit: 20
    t.string   "Password",       limit: 100
    t.string   "Province",       limit: 50
    t.string   "City",           limit: 50
    t.string   "County",         limit: 50
    t.integer  "CountyID"
    t.string   "Address",        limit: 200
    t.decimal  "Balance",                    precision: 18, scale: 2, default: 0.0
    t.decimal  "Frozen",                     precision: 18, scale: 0, default: 0
    t.datetime "CreateTime"
    t.datetime "Birthday"
    t.decimal  "Credit",                     precision: 18, scale: 0, default: 0
    t.integer  "IsDisable"
    t.string   "Phone",          limit: 20
    t.integer  "Roles"
    t.integer  "Authentication",                                      default: 0
    t.integer  "AuthentRoles"
    t.decimal  "BJZ",                        precision: 18, scale: 2, default: 0.0
    t.string   "Reason",         limit: 500
    t.string   "PayPWD",         limit: 128
  end

  create_table "MemberBankCard", primary_key: "ID", force: true do |t|
    t.integer  "MemberID"
    t.integer  "MemberType"
    t.string   "MemberPhone", limit: 20
    t.integer  "BankID"
    t.string   "BankBranch",  limit: 50
    t.string   "AccountName", limit: 50
    t.string   "AccountNO",   limit: 50
    t.datetime "CreateTime"
    t.integer  "IsBank"
  end

  create_table "MemberLog", primary_key: "ID", force: true do |t|
    t.string   "Phone",       limit: 20
    t.string   "Context",     limit: 500
    t.datetime "CreateTime"
    t.integer  "ContextType"
  end

  create_table "OnlineStatus", primary_key: "ID", force: true do |t|
    t.integer  "AdminUserID"
    t.string   "Mac",         limit: 50
    t.datetime "CreateTime"
  end

  create_table "OperationLog", primary_key: "ID", force: true do |t|
    t.integer  "AdminUserID"
    t.string   "ContextType", limit: 10
    t.string   "Context",     limit: 500
    t.datetime "Createtime"
  end

  create_table "OperationType", primary_key: "ID", force: true do |t|
    t.string "Code",          limit: 10
    t.string "OperationName", limit: 50
  end

  create_table "OrderFeeDetails", primary_key: "ID", force: true do |t|
    t.string   "OrderNO",   limit: 50,                          null: false
    t.string   "FeeType",   limit: 50
    t.decimal  "Amount",               precision: 18, scale: 2
    t.integer  "PayWay"
    t.datetime "PayTime"
    t.integer  "PayStatus"
    t.string   "OutId",     limit: 50
    t.boolean  "IsDelete"
  end

  create_table "OrderGoods", primary_key: "ID", force: true do |t|
    t.string   "OrderNo",       limit: 50
    t.integer  "MemberID"
    t.string   "SentTel",       limit: 20
    t.string   "SentName",      limit: 20
    t.string   "SentAddr",      limit: 200
    t.decimal  "SentAddrLat",               precision: 18, scale: 10
    t.decimal  "SentAddrLng",               precision: 18, scale: 10
    t.string   "TruckType",     limit: 50
    t.decimal  "TruckLong",                 precision: 6,  scale: 2
    t.string   "GoodsType",     limit: 50
    t.integer  "GoodsWeight"
    t.decimal  "GoodsVol",                  precision: 18, scale: 2
    t.datetime "SentStartTime"
    t.datetime "SentEndTime"
    t.datetime "TakeTime"
    t.string   "TakeTel",       limit: 20
    t.string   "TakeName",      limit: 20
    t.string   "TakeAddr",      limit: 200
    t.string   "TakeCare",      limit: 500
    t.decimal  "TakeAddrLat",               precision: 18, scale: 10
    t.decimal  "TakeAddrLng",               precision: 18, scale: 10
    t.integer  "OrderStatus"
    t.datetime "CreateTime"
    t.decimal  "GoodsPrice",                precision: 18, scale: 2
    t.integer  "IsNegotiate"
  end

  create_table "OrderInsurance", primary_key: "InsuranceNo", force: true do |t|
    t.string   "PolicyNO",   limit: 50
    t.string   "ProposalNO", limit: 50
    t.string   "OrderNO",    limit: 50
    t.integer  "Status"
    t.datetime "CreateTime"
    t.decimal  "EdorPrem",              precision: 18, scale: 2
  end

  create_table "OrderNegotiate", primary_key: "ID", force: true do |t|
    t.string   "OrderNO",    limit: 50
    t.integer  "MemberID"
    t.decimal  "Amount",                precision: 18, scale: 2
    t.datetime "CreateTime"
  end

  create_table "OrderTaking", primary_key: "ID", force: true do |t|
    t.integer  "MemberID"
    t.integer  "OrderGoodsID"
    t.datetime "CreateTime"
    t.integer  "DriverSentOk"
    t.integer  "DriverTakeOk"
    t.integer  "OrderTakeOk"
    t.integer  "Status"
    t.string   "Remark",       limit: 500
  end

  create_table "Settlement", id: false, force: true do |t|
    t.string   "OrderNo",           limit: 50
    t.decimal  "CopeWith",                     precision: 18, scale: 2
    t.integer  "SenderID"
    t.decimal  "SettlementAmount",             precision: 18, scale: 2
    t.datetime "SettlementTime"
    t.decimal  "CounterFee",                   precision: 18, scale: 2
    t.integer  "TransportID"
    t.integer  "TransactionStatus"
    t.integer  "ApplayStatus"
  end

  create_table "Shipper", primary_key: "ID", force: true do |t|
    t.integer  "MemberID"
    t.string   "CorpName",     limit: 20
    t.string   "CorpPhone",    limit: 20
    t.string   "LinkName",     limit: 20
    t.string   "LinkPhone",    limit: 20
    t.string   "ULinkName",    limit: 20
    t.string   "ULinkPhone",   limit: 20
    t.string   "ComName",      limit: 200
    t.string   "ComTel",       limit: 20
    t.string   "BLNO",         limit: 30
    t.string   "BLPhoto",      limit: 500
    t.datetime "CreateTime"
    t.datetime "AuditingTime"
    t.integer  "AdminUsersID"
  end

  create_table "Suggest", primary_key: "ID", force: true do |t|
    t.integer  "MemberID"
    t.integer  "MemberType"
    t.string   "Title",      limit: 50
    t.string   "Scontent",   limit: 200
    t.string   "Result",     limit: 100
    t.integer  "DealingId"
    t.datetime "CreateTime"
    t.datetime "DealTime"
    t.string   "DealMark",   limit: 200
  end

  create_table "SysMessage", primary_key: "ID", force: true do |t|
    t.integer  "MemberID"
    t.integer  "UserType"
    t.integer  "MsgType"
    t.string   "MsgTitle",   limit: 20
    t.string   "MsgContent", limit: 200
    t.datetime "CreateTime"
  end

  create_table "SysMessageType", primary_key: "ID", force: true do |t|
    t.string "Name",   limit: 50
    t.string "Remark", limit: 100
  end

  create_table "TruckLocation", primary_key: "ID", force: true do |t|
    t.integer  "TruckID"
    t.datetime "CreateTime"
    t.decimal  "Lat",        precision: 18, scale: 10
    t.decimal  "Lng",        precision: 18, scale: 10
  end

  create_table "TruckLong", primary_key: "ID", force: true do |t|
    t.decimal  "TLong",      precision: 8, scale: 2
    t.datetime "CreateTime"
  end

  create_table "TruckMessage", primary_key: "ID", force: true do |t|
    t.integer  "MemberID"
    t.string   "MemberName",         limit: 20
    t.string   "IDNumber",           limit: 30
    t.string   "HIDFPhoto",          limit: 500
    t.string   "MTFPhoto",           limit: 500
    t.string   "RTPPhoto",           limit: 500
    t.string   "QualificationPhoto", limit: 500
    t.string   "PlateNO",            limit: 50
    t.string   "RTNO",               limit: 50
    t.string   "QualificationNO",    limit: 50
    t.string   "DLHeadPhoto",        limit: 500
    t.string   "DLHeadNO",           limit: 50
    t.string   "DLTrailerPhoto",     limit: 500
    t.string   "DLTrailerNO",        limit: 50
    t.decimal  "TruckHigh",                      precision: 6, scale: 2
    t.decimal  "TruckWidth",                     precision: 6, scale: 2
    t.decimal  "TruckLong",                      precision: 6, scale: 2
    t.decimal  "MaxPayload",                     precision: 6, scale: 2
    t.datetime "CreateTime"
    t.datetime "AuditingTime"
    t.integer  "TruckType"
    t.integer  "AuditingType"
    t.string   "Reason",             limit: 500
  end

  create_table "TruckType", primary_key: "ID", force: true do |t|
    t.string   "TType",      limit: 20
    t.datetime "CreateTime"
  end

  create_table "TruckWeight", primary_key: "ID", force: true do |t|
    t.decimal  "TWeight",    precision: 8, scale: 2
    t.datetime "CreateTime"
  end

  create_table "VerificationCode", primary_key: "ID", force: true do |t|
    t.string   "Phone",      limit: 20
    t.string   "VCode",      limit: 10
    t.datetime "CreateTime"
    t.string   "MsgContent", limit: 200
  end

  create_table "Withdrawals", primary_key: "ID", force: true do |t|
    t.string   "WithdrawalsNO",     limit: 50,                           default: "[dbo].[CreateWithdrawalsNO]("
    t.integer  "MemberID"
    t.integer  "UserType"
    t.string   "BankName",          limit: 100
    t.integer  "BankID"
    t.string   "Tel",               limit: 50
    t.string   "AccountNumber",     limit: 50
    t.string   "AccountName",       limit: 50
    t.string   "BranchBank",        limit: 100
    t.decimal  "Amount",                        precision: 18, scale: 2
    t.integer  "Status"
    t.datetime "AuditTime"
    t.integer  "AuditerId"
    t.integer  "Remitter"
    t.datetime "RemittTime"
    t.decimal  "Remittance",                    precision: 18, scale: 2
    t.string   "RemittanceAccount", limit: 50
    t.decimal  "CounterFee",                    precision: 18, scale: 2
    t.datetime "CreateTime"
    t.integer  "IsBank"
  end

  create_table "sysdiagrams", primary_key: "diagram_id", force: true do |t|
    t.string  "name",         limit: 128, null: false
    t.integer "principal_id",             null: false
    t.integer "version"
    t.binary  "definition"
  end

  add_index "sysdiagrams", ["principal_id", "name"], name: "UK_principal_name", unique: true

end
