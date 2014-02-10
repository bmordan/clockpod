class StaffsController < ApplicationController
  def index
    @staff = Staff.all
  end
  
  def new
    @staff = Staff.new
  end
  
  def create
    @staff = Staff.new(staff_params)
    if @staff.save
      redirect_to @staff
    else
      render 'new'
    end
  end
  
  def show
    params[:month].nil? ? @month = Time.new.to_i : @month = Time.at(params[:month].to_i).to_i
    @member = Staff.find(params[:id])
    @overtime = Hash.new
    total = 0
    
    @member.clocks.each do |t|
      if t["intime"].strftime("%Y-%m") == Time.at(@month).strftime("%Y-%m")
        start = @member["start"].hour * 60 + @member["start"].min
        finish = @member["finish"].hour * 60 + @member["finish"].min
        intime = t["intime"].hour * 60 + t["intime"].min
        
        if t["out"].nil?
          string = t["intime"].strftime("%d/%m/%Y | %H:%M") + " - waiting..."
        else
          outtime = t["out"].hour * 60 + t["out"].min
          diff = start - intime + outtime - finish
          total += diff
          if diff > 30
            diff/60 < 0 ? h = 0 : h = diff/60
            m = diff - ( 60 * h )
            m.to_s.length > 1 ? m = m : m = "0" + m.to_s
            t.reason.nil? ? r = "form" : r = t.reason.reason + "[#{t.reason.id}"
            string = t["intime"].strftime("%d/%m/%Y | %H:%M") + t["out"].strftime(" - %H:%M") + " | " + h.to_s + "h " + m.to_s + "mins | " + r
          else
            string = t["intime"].strftime("%d/%m/%Y | %H:%M") + t["out"].strftime(" - %H:%M")
          end
        end    
      @overtime[t["id"]] = string
      end  
    end
    
    # format the total time
    total/60 < 0 ? th = 0 : th = total/60
    tm = total - (60 * th )
    @total = "Total for month: " + th.to_s + "h " + tm.to_s + "mins" unless th.to_s + tm.to_s == "00"
  end    

  def edit
    @staff = Staff.find(params[:id])
  end
  
  def update
    @staff = Staff.find(params[:id])
    if @staff.update(params[:staff].permit(:name, :start, :finish))
      redirect_to staffs_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @staff = Staff.find(params[:id])
    @staff.destroy
    redirect_to staffs_path
  end
  
  private
  def staff_params
    params.require(:staff).permit(:name, :start, :finish)
  end
end
