# ImageJ_z_stack_plugins
## A series of ImageJ plugins to run z stack imaging processing faster.
Theses are two FIJI (ImageJ) plugins I used to automate part of the image processing I needed with some confocal microscopy images. It has the potential to greatly improve the time to do repetitive image processing by still allowing some tuning in case you need to change the parameters used to proces certain group of images.

## How to install
To run the software provided, you will need to install the FIJI (ImageJ) software first. Once ready, you ill have to download the .ijm files and place them in the right directory. 
Depending on your sistem or instalation, the path should look like this
C:\Program Files (x86)\Fiji.app\scripts\Plugins
Once you have the files there, open the FIJI program an use the search bar or ctrl + L to search for the names of the plugins you just downloaded

## z-pro
### This plugin is designed to automate the z projection (max intensity) and channel individualization of confocal microscopy images (CZI format).
To use it properly:
- Once you run the plugin, you have to specify the path of the image you desire to analyze
- Next, choose the names you want to use for each chanel contained in the images
- Select the format you want to save the images in
- Choose if you want to save them at all (useful when you want to make tests before saving your final images)

![image](https://github.com/user-attachments/assets/2e4d1eb5-bd27-45f4-8911-a5c55a10bb4e)

- Since the plugin will open an image in CZI format, it might pop up some import options, make sure you select the following:

![image](https://github.com/user-attachments/assets/b17296fa-0cb9-4bb7-82c5-3e43723a48ef)

- Finally, accept and the result should look like this:

![image](https://github.com/user-attachments/assets/c40c5c8d-52b2-4ac0-a437-b652dfe28210)

If you chose the option to save images, the names should be based on the original file and the channel names.




## merge-enhance
### This plugin is meant to be used after the first one to select just some specific channels to merge and to tweek the values to enhance contrast. Again this should help automation of further image processing.
To use this plugin properly:
- Make sure you have at least to images open (could be immediately from the result of the previous plugin) and run the plugin
- Specify the names of the windows with the images you want to merge. For this step, you could use a keyword of a part of the name which is uniquely contained in the desired window (to avoid the necessity to type complete names), this is usually the name of the channel you specified while using the previous plugin.
- Next select the colors you want to use (you can recolor images in this step)
- Continue to select the min and max values to use for each channel
- Finally select if you want to save results and accept

![image](https://github.com/user-attachments/assets/4078c08b-ee3d-417f-8fe1-e0baab6b3838)

Your result should look like this (of course depending a lot on the image and the values used):
![image](https://github.com/user-attachments/assets/a79bf786-d77e-4efa-8895-f0c529c3ca18)



## Find a bug?
If you found an issue or would like to submit an improvement to this project, please submit an issue using the issues tab above. If you would like to submit a Pull Request with a fix, reference the issue you created.

## Known issues (Work in progress)
The pluggins are deffinitely overfitted to my applications, therefore they lack some generalization features:
- The kind of z-projection can only be changed directly through the code if you want other than max intensity
- The scale bar can only be changed again directly through the code. Didn't know how often I would need to change it and if it would be annoying to have a really long list of features to tweek every time I ran the plugin, if at the end I usually just changed one or two features when changing from groups of images
- Batch implementation to run on directories full of images should be a must if working with hundreds of images for example, but for my workload at the time it was not necessary
- Finally, I think the plugin might crash if used with weird numbers of images (I have never used more than 4 channels, but if so, some moddifications might be needed).
