# iOS-WalE
Table of Contents:
1. Description
2. Getting started
3. Arhitecture
4. Deployment
5. API


---------------
1. Description
	NASA releases the Astronomy Picture of the Day everyday. This is accompanied by the title of the picture and a short explanation of about it. This project is developed using Swift programming language and MVVM architecture design pattern with minimum version support of iOS 14.0.

2. Getting started
* This project is implemented using the Model-View-ViewModel (MVVM) architecture pattern.
* Make sure you have the Xcode version 14.0 or above installed on your computer.
* Download the project files from the repository.
* Open the project files in Xcode.
* Review the code and make sure you understand what it does.
* Run the active scheme.
* You should see the text Picture of the Day everyday to the screen. 

3. Architecture
* This project is implemented using the Model-View-ViewModel (MVVM) architecture pattern.
* Model has necessary data needed to display the fetched data.
* View is responsible for displaying the message to the user, such as printing it to the console.
* ViewModel handles API logic, business logic and update the Model and View as needed.
* View Controller handles any user input or interactions.
* API Service handles the API calling i which i have used NSURLSession for Api calling.

4. Deployment
* Click on the "Product" menu in Xcode and select "Archive." This will create an archive of your project.
* Once the archive has been created, select it in the Organiser window and click on the "Validate" button to perform some preliminary tests on the app.
* Once validation is complete, click on the "Distribute" button and select "Ad Hoc" or "App Store" distribution. This will create a signed IPA file that can be installed on iOS devices.
* Once the distribution is complete, you can use the IPA file to install the app on iOS devices

5. Workflow:
* Reporting bugs: If you come across any issues while using the Project, please report them by creating a new issue on the GitHub repository.
* Submitting pull requests:  If you have a bug fix or a new feature you'd like to add, please submit a pull request. Before submitting a pull request, please make sure that your changes are well-tested and that your code adheres to the Swift style guide.
* Improving documentation:  If you notice any errors or areas of improvement in the documentation, feel free to submit a pull request with your changes.
* Providing feedback: If you have any feedback or suggestions for the HelloWorld project, please let us know by creating a new issue or by sending an email to the project maintainer.

6. API: 
* We are using a REST API
* For HTTP networking we are using NSURLSession



Improvement Areas :
1. Provide user-friendly error messages and retry mechanisms
2. Implement background sync to update local data when connectivity is restored.
3. Add support for multiple languages to make the app accessible to a broader audience.
4. Implement unit and integration tests to ensure code reliability and facilitate easier future modifications. 
5. Improve the UI/UX design to make the app more engaging and user-friendly
	- Choose a font that is easy to read. Use appropriate font sizes and weights for titles and explanations to ensure legibility.
	- Ensure that the APOD image is displayed in high resolution without distortion or clipping. 
	- Use responsive image handling techniques to adapt the image size to various screen sizes.
	- Maintain the correct aspect ratio of the image to avoid stretching or squeezing.
