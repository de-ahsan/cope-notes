# frozen_string_literal: true

class Api::V1::BaseController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[create update destroy]
end
