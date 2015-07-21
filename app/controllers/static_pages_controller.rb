class StaticPagesController < ApplicationController
  def index
    @no_breadcrumbs = true
  end
end
