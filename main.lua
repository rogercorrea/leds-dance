
dofile("config_wifi.lua")
pin_led_white = 4
pin_led_red = 1
pin_led_blue = 2

state_led_white = 0
state_led_red = 0
state_led_blue = 0

gpio.mode(pin_led_white, gpio.OUTPUT)
gpio.mode(pin_led_red, gpio.OUTPUT)
gpio.mode(pin_led_blue, gpio.OUTPUT)

gpio.write(pin_led_white, gpio.LOW)
gpio.write(pin_led_red, gpio.LOW)
gpio.write(pin_led_blue, gpio.LOW)

mils = math.random(500, 1000)

tmr.register(1, mils, 1, function() 
    if (state_led_white == 0) then
        gpio.write(pin_led_white, gpio.HIGH)
        state_led_white = 1
    else
        gpio.write(pin_led_white, gpio.LOW)
        state_led_white = 0
    end
end)

mils = math.random(500, 1000)

tmr.register(2, mils, 1, function() 
    if (state_led_blue == 0) then
        gpio.write(pin_led_blue, gpio.HIGH)
        state_led_blue = 1
    else
        gpio.write(pin_led_blue, gpio.LOW)
        state_led_blue = 0
    end
end)

mils = math.random(500, 1000)

tmr.register(3, mils, 1, function() 
    if (state_led_red == 0) then
        gpio.write(pin_led_red, gpio.HIGH)
        state_led_red = 1
    else
        gpio.write(pin_led_red, gpio.LOW)
        state_led_red = 0
    end
end)

tmr.start(1)
tmr.start(2)
tmr.start(3)