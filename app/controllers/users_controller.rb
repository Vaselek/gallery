class UsersController < ApplicationController
  def index
  end

  def show
    @commentary = Commentary.new
  end
end
