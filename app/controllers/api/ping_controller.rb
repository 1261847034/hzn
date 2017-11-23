class Api::PingController < Api::BaseController

  def index
    render json: { ping: "pong" }
  end

  def count
  	return render json: { message: '参数错误'} unless params[:type].in?(%w(browser answer))

  	key = "page:#{params[:type]}:count"
  	$redis.incr(key)

  	render json: { count: $redis.get(key).to_i }
  end

end
