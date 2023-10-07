class PagesController < ApplicationController
  def home
  end
  def hello
    HelloJob.perform_async()
    # HelloJob.perform_at(10.seconds.from_now)
    redirect_back(fallback_location: root_path)
  end
end
