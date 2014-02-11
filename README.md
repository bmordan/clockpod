![CLockPod](/app/assets/images/logo_pink_shadow.png "CLockPod")

ClockPod is a simple time management app. To get it working you need to set up the Adafruit PN532 NFC/RFID controller shield on an Arduino uno board.

Upload the Adafruit I2C sketch (I have adapted this to flash an LED on reading of a card but you don't need to do this)

Then daemonise your rails server like this $rails s -b ip.ip.ip.ip -d

the -d flag runs the rails server in the background. Then you can daemonise the NFC reader by installing the daemon gem (daemons.rubyforge.org) and running db/clockpod.rb

To add a new member use the web GUI and make a note of their id number (n). To add a card to the reader edit the /db/uno.rb file and add

if card.include?("THxE UNxI QUxE CAxR D_xID")
  id = "n"
  output(id)
end

**bernard** 


