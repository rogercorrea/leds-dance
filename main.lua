--dofile("config_wifi.lua")

function start_leds()

    pins = {4, 1, 2}
    state = {}

    for i, pin in pairs(pins) do
        table.insert(state, 0)
        
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

start_leds()
