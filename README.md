# Compmanager

## Why?
The initiative to create this plugin was because I didn't like the way we create components in <b>Flutter</b>.
<br><br>
Every time we create a separate file to put all the business rules of a certain component it was usually necessary to pass functions by parameters for that component to perform the necessary action in our screen, so I thought of a way to manage components in our project, where all of them will follow a pattern defined in the <b>Compmanager</b>, thus facilitating the communication between the component and the screen.
<br><br>
The main focus of the <b>Compmanager</b> is basically to create components for a certain screen and have access to the necessary attributes within the screen to make the changes you want. Of course, a particular component that is generally reusable can also be created using compmanager.

## How to use?
Well, in addition to the example project that is here in the repository I will create one more basic example for you to see what idea I propose.
<br><br>
But first I want to explain that the creation of the <b>Compmanager</b> was also thought a little using <b>Object Orientation</b>.
Well, as an example, I will recreate the famous count screen that comes in the standard Flutter documentation using <b>Compmanager</b>.

With your project created let's start making changes to the main.dart file.
<br><br>
First remove all the code that is in the file.
<br><br>
After that we will configure pubspec.yaml by adding the Compmanager dependency.
<br>
![image](https://user-images.githubusercontent.com/48370450/166603998-8b56746f-c060-4065-8dae-84a72efd3549.png)
<br><br>
Now in main.dart we will create the classes needed to create our counter.
<br><br>
Basically every screen that you want to use components of must implement the abstract class IScreen, in which case you will be asked to override the methods emitScreen and receive.
<br>
![image](https://user-images.githubusercontent.com/48370450/166608304-f5354a1b-92d7-45dc-8b27-a328cc045165.png)
<br><br>
In this example we will actually use the StatelessWidget and you may notice that it is implementing IScreen. The emitScreen method is used by the component, basically when the component wants to perform some action on the screen it will call this method, and as you can notice this method takes an IComponent as an argument, so you can tell which component the event is being emitted from, by default when emitScreen is called then our screen automatically calls the event from the component.
<br><br>
The receive method is basically used so that this screen itself can be called on other screens, and by this method you will be able to pass what message, for example a delete or update action, pass a dynamic value, a String or an int among others and even identify from which screen that call was made.
<br><br>
You can notice that as we used a private attribute on the screen, we created a getNotifier for our components to use this method to have access to this attribute and change.

## Creating the component
Now we are going to create our component, so create a new file with the name you want and use the following code.
<br>
![image](https://user-images.githubusercontent.com/48370450/166605687-ad8ccce7-a4a5-46a5-936b-b34657170163.png)
<br><br>
It is important to understand that as we need to make changes to the screen, we will pass the same via the constructor.
<br><br>
In the component you can notice that it implements the IComponent, at this moment it is passed which screen you will use this component, in case you are going to use it in several screens you can pass AnyScreen, after it is placed the Widget type that it will be used and in the last one the return type of the methods. For example, if by chance you want an action on your screen to have a Dialog first indicating if it wants to do a certain action, you can pass a Future instead of void, so all methods will be returned as Future.
<br><br>
We also have the init method, this method is for initializing properties of the component if it has them, use it in the constructor if you need to. <br>
The afterEvent and beforeEvent methods are basically used to perform actions before and after the event, if you need to implement your rule in these methods and call them together in the event method, this way you can perform an action before and after the desired change in the screen.
<br><br>
If you are not going to use any of the methods, just create a reusable component on the screens without changing any information, just pass void and leave the methods with return.

## Calling the component on the screen.
Since we are using the StatelessWidget we will instantiate the component directly in the constructor, if you are using the StatefulWidget you can do this in the initState method.
<br>
![image](https://user-images.githubusercontent.com/48370450/166607241-d9ca8885-f128-4d6f-9467-76ac0ae47e8f.png)
<br><br>
After creating the instance of the component we will call it in Scaffold.
<br>
![image](https://user-images.githubusercontent.com/48370450/166608336-986e7619-c61e-4657-8624-944fbe242fa6.png)
<br><br>
When you run the project you will see that the counter is running correctly.
<br>
![image](https://user-images.githubusercontent.com/48370450/166608436-722bc210-32cd-490d-915c-31d0a1adef1a.png)

## Dependency injection and the Conversable class
