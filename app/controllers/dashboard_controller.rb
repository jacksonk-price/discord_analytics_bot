class DashboardController < ApplicationController
  def index
    @members = Member.all
    @channels = Channel.all
  end
end
