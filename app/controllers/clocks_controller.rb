class ClocksController < ApplicationController
  def index
    @clocks = Clock.all
  end
  
  def show
    @reasons = Clock.find(params[:id])
  end
  
  def edit
    @clock = Clock.find(params[:id]) 
  end
  
  def update
    @clock = Clock.find(params[:id])
    
    if @clock.update(clock_params)
      redirect_to staffs_path
    else
      render 'edit'
    end    
  end  
  
  private
  def clock_params
    params.require(:clock).permit(:staff_id, :intime, :out)
  end  
         
end
