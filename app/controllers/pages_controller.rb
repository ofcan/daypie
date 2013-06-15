class PagesController < ApplicationController

  def index
    @pies = Pie.all
  end

end
