# love2dFancyControllers
Allows setting the LED color of a controller directly from LOVE2D.

I might eventually expand this to add support for things like the Dualsense triggers depending on if I ever need that functionality for a project.

`main.lua` contains a simple example for the usage of this library.

## Usage
Add `fancyControllers.lua` to your source code.
If you are using LOVE2D 11.0, require it as
```lua
require('fancyControllers')('SDL2')
```
Otherwise, require it as
```lua
require('fancyControllers')('SDL3')
```

From there, setting a controller's LED color is as simple as calling
```lua
love.joystick.setLED(joystick,r,g,b)
```
where `joystick` is a Joystick object, and `r,g,b` are numbers from 0 to 1.