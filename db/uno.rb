#!/usr/bin/ruby
require "serialport"
require "sqlite3"

port_str="/dev/ttyACM0"
baud_rate=115200
data_bits=8
stop_bits=1
parity=SerialPort::NONE
sp = SerialPort.new(port_str,baud_rate,data_bits,stop_bits,parity)
puts "card reader up and running"
      
def output(id)
  db = SQLite3::Database.new( "/home/pi/clockpod/db/development.sqlite3" )
  db.results_as_hash = true
  t = Time.new
  check = db.execute( "select * from clocks where staff_id=#{id} and substr(intime,0,11)=date();" )

  if check.empty? #if nothing for that staff member on that day write to db
    db.execute( "insert into clocks (staff_id,intime) values (#{id},'#{t}');" )
    puts "insert into clocks (staff_id,intime) values (#{id},'#{t}');"
  else
    if t > Time.parse(check[0]["intime"]) + 2*60 # 2 min buffer then add the out time
      db.execute( "update clocks set out='#{t}' where staff_id=#{id} and substr(intime,0,11)=date();" )
      puts "update clocks set out='#{t}' where staff_id=#{id} and substr(intime,0,11)=date();"
    else
      puts "no wait"
    end    
  end
  
end
 
while true do
  
  while(card=sp.gets)do
   
    puts card
   
    if card.include?("0xAB 0x60 0xE5 0x04")
      id = "1"
      output(id)
    end
    
    if card.include?("bernardbernard")
      id = "2"
      output(id)
    end

    if card.include?("0x7B 0x65 0x98 0xB1")
      id = "3"
      output(id)
    end

  end
  
end
sp.close
