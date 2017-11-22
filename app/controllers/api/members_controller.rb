class Api::MembersController < Api::BaseController

  def show
    @member = Member.find_by(MemberID: params[:id])

    if @member
      render json: { Status: 1, Data: @member.as_json }
    else
      render json: { Status: 0, Message: '参数错误' }
    end
  end

  def login
    @member = Member.find_by(login_params)

    if @member
      render json: { Status: 1, Data: @member.as_json }
    else
      render json: { Status: 0, Message: '账号或密码错误' }
    end
  end

  def register
    @member = Member.new(register_params)

    if @member.save
      render json: { Status: 1, Data: @member.as_json }
    else
      render json: { Status: 0, Message: @member.errors.full_messages.join(',') }
    end
  end

  private

  def login_params
    params.permit(:Phone, :Password)
  end

  def register_params
    params.permit(:Phone, :Password, :Province, :City, :County, :Roles)
  end

end
