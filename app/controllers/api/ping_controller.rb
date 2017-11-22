class Api::PingController < Api::BaseController

  def index
    render json: { ping: "pong" }
  end

end
