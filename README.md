# Exercise-03b-Tweening-and-Screen-Shake
Exercise for MSCH-C220, 22 September 2020

This exercise is designed to explore adding tweening and screen shake to our boring brick breaker game (in the spirit of "Juice it or Lose it"). This builds on the last exercise (that added colors and particles).

Fork this repository. When that process has completed, make sure that the top of the repository reads [your username]/Exercise-03b-Tweening-and-Screen-Shake. *Edit the LICENSE and replace BL-MSCH-C220-F20 with your full name.* Commit your changes.

Clone the repository to a Local Path on your computer.

Open Godot. Import the project.godot file and open the "Tweening and Screen Shake" project.

You should see a very basic brick-breaker game with a HUD that will control certain effects: adding color, particles, and now: adding some dynamicism to the bricks, the camera, and the paddle.

The signals have all been connected, and the code should basicallly be in place. Your assignment is to edit the following scripts, completing the HUD.* if statements:

 * /Brick/Brick.gd (start_brick() and die())
 * /Paddle/Paddle.gd (start_paddle() and `_physics_process()`)
 * /Ball/Ball.gd (screen_shake())
 * /Camera/Camera.gd


We will talk in detail in class how to complete this exercise. 

For the screen shake, replace the contents of Camera.gd with the following (also, add this to your Gists):
```
extends Camera2D
# Originally developed by Squirrel Eiserloh (https://youtu.be/tu-Qe66AvtY)
# Refined by KidsCanCode (https://kidscancode.org/godot_recipes/2d/screen_shake/)

export var decay = 0.8                      # How quickly the shaking stops [0, 1].
export var max_offset = Vector2(100, 50)    # Maximum hor/ver shake in pixels.
export var max_roll = 0.1                   # Maximum rotation in radians (use sparingly).
export (NodePath) var target                # Assign the node this camera will follow.

var trauma = 0.0                            # Current shake strength.
var trauma_power = 2                        # Trauma exponent. Use [2, 3].
onready var noise = OpenSimplexNoise.new()
var noise_y = 0

func _ready():
  randomize()
  noise.seed = randi()
  noise.period = 4
  noise.octaves = 2

func _process(delta):
  if target:
    global_position = get_node(target).global_position
  if trauma:
    trauma = max(trauma - decay * delta, 0)
    shake()
    
func shake():
  var amount = pow(trauma, trauma_power)
  noise_y += 1
  rotation = max_roll * amount * noise.get_noise_2d(noise.seed, noise_y)
  offset.x = max_offset.x * amount * noise.get_noise_2d(noise.seed*2, noise_y)
  offset.y = max_offset.y * amount * noise.get_noise_2d(noise.seed*3, noise_y)
  
func add_trauma(amount):
  trauma = min(trauma + amount, 1.0)
```

Test the project. You should be able to turn on and off the effects using the Menu (press Esc to activate).

Quit Godot. In GitHub desktop, add a summary message, commit your changes and push them back to GitHub. If you return to and refresh your GitHub repository page, you should now see your updated files with the time when they were changed.

Now edit the README.md file. When you have finished editing, commit your changes, and then turn in the URL of the main repository page (https://github.com/[username]/Exercise-03b-Tweening-and-Screen-Shake) on Canvas.

The final state of the file should be as follows (replacing my information with yours):
```
# Exercise-03b-Tweening-and-Screen-Shake
Exercise for MSCH-C220, 24 September 2020

The second part of an exploration of the "Juice it or Lose it" GDC 2012 presentation in Godot.

## Implementation
Built using Godot 3.2.2

## References
[Juice it or Lose it](https://www.youtube.com/watch?v=Fy0aCDmgnxg)

## Future Development
Music and sound effects; shaders; add a face!

## Created by 
Jason Francis

```
