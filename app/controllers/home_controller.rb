class HomeController < ApplicationController
  def index
    @organization = Organization.try(&:first) || Organization.new
    @pipe = @organization.last_pipe
  end

  def fetch
    fetch_data

    redirect_to root_path
  end

  private

  def fetch_data
    FetchData.fetch!
  end
end
