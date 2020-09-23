# Exercise-03a-Colors-and-Particles
Exercise for MSCH-C220, 22 September 2020

This exercise is designed to explore adding color and particle effects to a boring brick breaker game (in the spirit of "Juice it or Lose it").

Fork this repository. When that process has completed, make sure that the top of the repository reads [your username]/Exercise-03a-Color-and-Particles. *Edit the LICENSE and replace BL-MSCH-C220-F20 with your full name.* Commit your changes.

Clone the repository to a Local Path on your computer.

Open Godot. Import the project.godot file and open the "Color and Particles" project.

You should see a very basic brick-breaker game with a HUD that will control certain effects: adding color to the blocks, the paddle, and the ball; and adding particle effects to the blocks, the paddle, and the walls.

The signals have all been connected, and the code should basicallly be in place. Your assignment is to edit the following scripts, adding functionality to the update_color and emit_particle methods:

 * /Background/Background.gd
 * /Ball/Ball.gd
 * /Brick/Brick.gd
 * /Paddle/Paddle.gd
 * /Walls/Walls.gd

All color references correspond to those defined in the [Open Color scheme](https://yeun.github.io/open-color/). In GDScript, to change the color, use
```
		$Color.color = Color8(R,G,B)
```
and to change back to white, use:
```
		$Color.color = Color(1,1,1,1)
```

The colors should behave as follows:

For the bricks:
 * Row 0 is RED 8
 * Row 1 is Orange 6
 * Row 2 is Yellow 3
 * Row 3 is Lime 5
 * Row 4 is Blue 6
 * Row 5 is Violet 5
 * Row 6 is Grape 6

For the paddle:
 * Gray 5

For the ball:
 * Cyan 5

You will also need to edit the particle emmitters in the Walls, Paddle, and Bricks nodes so that the paddle emits confetti, and the walls and bricks emit bubbles (the assets are in the Assets folder).

For the particles emitters:
For the walls:
 * Emitting = off
 * Amount = 5
 * Lifetime = 0.25
 * One Shot = on
 * Texture = /Assets/bubble.png
 * Process Material->Material = new ParticlesMaterial
  * Direction->Spread = 75
  * Gravity = 0
  * Initial Velocity->Velocity = 200
  * Scale->Scale Curve = new CurveTexture (make it ramp to 0)
  * Color->Color Ramp = new GradientTexture (make it ramp to 0)
 When the ball hits the walls, move the Particles2D position and rotation and set emitting=true
 
 For the paddle:
 * Emitting = off
 * Lifetime = 0.4
 * One Shot = on
 * Texture = /Assets/confetti.png
 * Process Material->Material = new ParticlesMaterial
  * Direction->Spread = 45
  * Initial Velocity->Velocity = 400
  * Initial Velocity->Velocity Rand = 0.5
  * Angular Velocity->Velocity = 100
  * Angular Velocity->Velocity Rand = 1
  * Scale->Scale Curve = new CurveTexture (make it ramp to 0)
  * Color->Color Ramp = new GradientTexture (make it ramp to 0)
 When the ball hits the paddle, move the Particles2D position and rotation and set emitting=true
 
 For the brick (in /Bricks/Bricks.tscn):
 * Emitting = off
 * Amount = 20
 * Lifetime = 0.4
 * One Shot = on
 * Texture = /Assets/bubble.png
 * Process Material->Material = new ParticlesMaterial
  * Direction->Spread = 180
  * Gravity = 0
  * Initial Velocity->Velocity = 400
  * Scale->Scale Curve = new CurveTexture (make it ramp to 0)
  * Color->Color Ramp = new GradientTexture (make it ramp to 0)
 When the ball hits the block, move the Particles2D position and rotation and set emitting=true

Test the project. You should be able to turn on and off the effects using the Menu (press Esc to activate).

Quit Godot. In GitHub desktop, add a summary message, commit your changes and push them back to GitHub. If you return to and refresh your GitHub repository page, you should now see your updated files with the time when they were changed.

Now edit the README.md file. When you have finished editing, commit your changes, and then turn in the URL of the main repository page (https://github.com/[username]/Exercise-03a-Colors-and-Particles) on Canvas.

The final state of the file should be as follows (replacing my information with yours):
```
# Exercise-03a-Colors-and-Particles
Exercise for MSCH-C220, 22 September 2020

The first steps of an exploration of the "Juice it or Lose it" GDC 2012 presentation in Godot.

## Implementation
Built using Godot 3.2.2

## References
[Juice it or Lose it](https://www.youtube.com/watch?v=Fy0aCDmgnxg)

## Future Development
Tweening, screen shake, music, and sound effects

## Created by 
Jason Francis

```
