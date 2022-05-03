# Compmanager

## Why?
The initiative to create this plugin was because I didn't like the way we create components in <b>Flutter</b>. <br>
Every time we create a separate file to put all the business rules of a certain component it was usually necessary to pass functions by parameters for that component to perform the necessary action in our screen, so I thought of a way to manage components in our project, where all of them will follow a pattern defined in the <b>Compmanager</b>, thus facilitating the communication between the component and the screen. <br>
The main focus of the <b>Compmanager</b> is basically to create components for a certain screen and have access to the necessary attributes within the screen to make the changes you want. Of course, a particular component that is generally reusable can also be created using compmanager.

## How to use?
Well, in addition to the example project that is here in the repository I will create one more basic example for you to see what idea I propose. <br>
But first I want to explain that the creation of the <b>Compmanager</b> was also thought a little using <b>Object Orientation</b>.
Well, as an example, I will recreate the famous count screen that comes in the standard Flutter documentation using <b>Compmanager</b>.

With your project created let's start making changes to the main.dart file. <br>
First remove all the code that is in the file.
After that we will configure pubspec.yaml by adding the Compmanager dependency.
