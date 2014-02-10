#!/usr/bin/ruby
require "serialport"
require "sqlite3"

port_str="/dev/tty.usbmodem1411"
baud_rate=115200
data_bits=8
stop_bits=1
parity=SerialPort::NONE
sp = SerialPort.new(port_str,baud_rate,data_bits,stop_bits,parity)
puts "card reader up and running"

def output(id)
    db = SQLite3::Database.new( "development.sqlite3" )
    db.results_as_hash = true
    t = Time.new
    check = db.execute( "select * from clocks where staff_id=#{id} and substr(intime,0,11)=date();" )
    
    if check.empty? #if nothing for that staff member on that day write to db
        db.execute( "insert into clocks (staff_id,intime) values (#{id},'#{t}');" )
        ping
        else
        if t > Time.parse(check[0]["intime"]) + 2*60 # 2 min buffer then add the out time
            db.execute( "update clocks set out='#{t}' where staff_id=#{id} and substr(intime,0,11)=date();" )
            ping
            else
            puts "no wait"
        end
    end
    
end

def ping
    fork{exec "play /Users/bernie/Documents/Sites/nfc1/app/assets/sound/sound.wav"}
end

while true do
    
    while(card=sp.gets)do
        
        if card.include?("bernard")
            id = "1"
            output(id)
        end
        
        if card.include?("1C CE 00 20")
            id = "2"
            output(id)
        end
        
        if card.include?("siriol")
            id = "3"
            output(id)
        end    
        
    end
    
    end
    sp.close
