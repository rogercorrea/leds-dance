<<<<<<< HEAD
dofile("config_wifi.lua")
=======

pin_led_white = 4
pin_led_red = 1
pin_led_blue = 2

state_led_white = 0
state_led_red = 0
state_led_blue = 0
>>>>>>> 5e5b22cead16bc30e7669e13aed1305c61bf07f6

function start_leds()

    pins = {4, 1, 2}
    state = {0, 0, 0}

    for i, pin in pairs(pins) do
        gpio.mode(pin, gpio.OUTPUT)
        gpio.write(pin, gpio.LOW)

        mils = math.random(500, 1000)

        tmr.register(i, mils, 1, function() 
            if (state[i] == 0) then
                gpio.write(pin, gpio.HIGH)
                state[i] = 1
            else
                gpio.write(pin, gpio.LOW)
                state[i] = 0
            end
        end)
        tmr.start(i)        
    end
end

<<<<<<< HEAD
start_leds()
=======
tmr.start(1)
tmr.start(2)
tmr.start(3)
>>>>>>> 5e5b22cead16bc30e7669e13aed1305c61bf07f6
