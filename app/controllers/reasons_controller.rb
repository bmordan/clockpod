class ReasonsController < ApplicationController
  def index
    @reason = Reason.all
  end
  
  def new
    @reason = Reason.new
  end
    
  def create
    @reason = Reason.new(reason_params)
    @reason.save
    redirect_to staffs_path  
  end
  
  def edit
    @reason = Reason.find(params[:id])   
  end 
  
  def update
    @reason = Reason.find(params[:id])
    if @reason.update(params[:reason].permit(:reason))
      redirect_to staffs_path
    else
      render 'edit'
    end
  end   
  
  private
  def reason_params
    params.require(:reason).permit(:clock_id, :reason)
  end    
end
