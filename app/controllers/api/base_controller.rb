class Api::BaseController < ApplicationController

  skip_before_filter :verify_authenticity_token

  include ActionController::MimeResponds
  include ActionController::HttpAuthentication::Token

  wrap_parameters false

  respond_to :json

  private
  def formated_response(data, options = {})
    _data = HashWithIndifferentAccess.new()

    _data["data"] = data
    _data.reverse_merge! options

    _data.reverse_merge!(code: "-1")

    _data
  end

  def default_serializer_options
    { root: false }
  end
end
