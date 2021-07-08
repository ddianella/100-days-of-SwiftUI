# Project 10. Cupcake Corner

In this project I built a multi-screen app for ordering cupcakes.
## Challenge
1. Our address fields are currently considered valid if they contain anything, even if it’s just only whitespace. Improve the validation to make sure a string of pure whitespace is invalid.
2. If our call to placeOrder() fails – for example if there is no internet connection – show an informative alert for the user. To test this, just disable WiFi on your Mac so the simulator has no connection either.
3. For a more challenging task, see if you can convert our data model from a class to a struct, then create an ObservableObject class wrapper around it that gets passed around. This will result in your class having one @Published property, which is the data struct inside it, and should make supporting Codable on the struct much easier.

<img src="https://user-images.githubusercontent.com/77059554/124909724-78b35e00-dff3-11eb-832c-6a59ba8f7c2c.gif" width="250" height="530" />
