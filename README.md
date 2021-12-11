# Setting up your player sprite sheet to work with this shader
1. Import your sprite sheet into Unity
2. Click on your imported sprite sheet
3. Look at the 'Inspector' tab
4. Set 'Sprite Mode' to Multiple
5. Then open up 'Sprite Editor'
6. Click 'Slice'>'Grid by Cell Size' and enter appropriate "Pixel Size" x and y values 
7. IMPORTANT STEP: Click on 'Sprite Editor' tab, this will open up a dropdown menu with 4 options. Choose option "Custom Outline"
8. In "Sprite Editor">"Custome Outline", click on the first sprite, then click "Generate" at the top which will generate a shape with several points around the sprite. Remove all but 4 points. Make a box shape that matches the Cell Size. Then, with the first sprite still selected, click on 'Copy' at the top and finally click "Paste All".
9. Repeat 1-8 for all sprite sheets you imported

# Setup in Unity
1. Open a new scene
2. Create an empty game object & name it Player
3. Add the Sprite Renderer component
4. Add the Animator component
5. Create your animation clips by selecting sprites from the players main spritesheet and drag them onto the player
6. This will create an AnimatorController, name it "PlayerAnimatorController"
7. In the Player>Animator component, set the Controller to "PlayerAnimatorController"
8. This will also create an AnimationClip, name it whatever you want
9. Setup your animations in the Animator tab in unity

# Using my material + shader to allow for easy sprite swapping
1. Drag PlayerMaterial.mat onto your player game object
2. Click on the Player gameobject in your scene
3. In the Inspector, scroll down to the PlayerMaterial tab and click on the dropdown arrow
4. Set the Main SpriteSheet texture to your players base spritesheet
5. Set the Current SpriteSheet texture to your players base spritesheet as well
6. Now, add ManageSprite.cs to the Player gameobject
7. In the Inspector, inside ManageSprite (Script), add your characters main spritesheet to the PlayerSpriteSheets list.
8. Add as many alternate character spritesheets to this list!
9. Now edit ManageSprite.cs Update() code to change your characters current spritesheet to any spritesheets from your PlayerSpriteSheets list! This will let you change your characters appearance in game without having to create new animation clips, thus allowing you to reuse your animation clips!

# Feedback is welcome!
I am no shader expert. I basically looked at the unity docs, figured out how to make an unlit shader and then parsed their unlit/transparent shader to figure out how to make the texture transparent. Seems to be working just fine so far, but please report any bugs.
