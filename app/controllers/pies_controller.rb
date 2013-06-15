class PiesController < ApplicationController
  
  before_filter :find_pie, :only => [:show, :edit, :update, :destroy]
  before_filter :assert_current_user, :only => [:new, :create]
  before_filter :assert_baker, :only => [:edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @pie = Pie.new
  end

  def create
    @pie = Pie.new(params[:pie])
    @pie.user = current_user
    if @pie.save
      redirect_to @pie, notice: 'Pie baked.'
    else
      render :new
      flash.now[:alert] = "Something is wrong. Can't bake the pie."
    end
  end

  def edit
  end

  def update
    if @pie.update_attributes(params[:pie])
      redirect_to @pie, notice: 'Pie re-baked.'
    else
      render :edit
      flash.now[:alert] = "Something is wrong. Can't re-bake the pie."
    end
  end

  def destroy
    @pie.destroy
    redirect_to root_path, notice: 'Pie destroyed.'
  end

  private

  def find_pie
    @pie = Pie.find(params[:id])
  end

end
