# Paclock PR1 Key
PR1.scad contains code used to generate a Paclock PR1 (Pro/200K) key.  
To use this, load the .scad in [OpenSCAD](https://openscad.org) and input your key bitting cuts into the customizer.  

## Example Key
One of the keys used to gather information and intel was coded 6212121:
![Paclock 200K 6212121](https://github.com/Lock-RE/3d-lock-library/edit/main/Paclock/Resources/PR1%20Key.jpg)

The generated key:  
![Paclock 200K 6212121 Generated](https://github.com/Lock-RE/3d-lock-library/edit/main/Paclock/Resources/PR1%20Key%20Generated.png)

## Process
The process for figuring out how to create any key involved tracing the key out as an SVG, approximating what the blank should look like using images from Paclock and simple guessing:  
![Paclock PR1 Blank](https://github.com/Lock-RE/3d-lock-library/edit/main/Paclock/PR1%20Blank.svg)

A rubbing of the back of the plug to trace and recreate the keyway itself:  
![Paclock PR1 Rubbing](https://github.com/Lock-RE/3d-lock-library/edit/main/Paclock/Resources/PR1%20Keyway%20Rubbing.jpg)  

A note: The core appears to have slightly less aggressive and softened edges compared to how the key itself is milled. To match the key milling, more measurements from a key were taken to get this exact as possible.  

The final steps were to measure the key depth and spacing, which appear to be as follows:  
- Cut Spacing
	- First Cut is 0.145" from the shoulder.
	- Following cuts are 0.1375" from each other.
- Cut Depths
	- The depths appear to re-use American Lock 1 and 2, 5, and 8, inserting new spots halfway between 2 and 5, and 5 and 8.
		- Depth 1: 0.2840"
		- Depth 2: 0.2684"
		- Depth 3: 0.2450" (Halfway between American Lock 2 and 5)
		- Depth 4: 0.2215" (American Lock 5)
		- Depth 5: 0.1981" (Halfway between American Lock 5 and 8)
		- Depth 6: 0.1747" (American Lock 8)

## 3D Printable?
The resulting key is roughly 3D printable, however since the measurements are as close to exact as possible, printing may need to shrink the key very slightly depending on tolerances to get it to work in the lock. Good luck!
