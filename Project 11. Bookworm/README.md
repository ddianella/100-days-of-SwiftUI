# Project 11. Bookworm

I built an app to track which books you’ve read and what you thought of them. I completed learn is one of Apple’s frameworks: Core Data. 
I found out about @Binding property wrapper, which lets us create a mutable value in a view, that actually points to some other value from elsewhere, how to use size classes with AnyView type erasure and combine Core Data and SwiftUI, @FetchRequest, how to delete from a Core Data fetch request and other important skills.

##  Challenge
1. Right now it’s possible to select no genre for books, which causes a problem for the detail view. Please fix this, either by forcing a default, validating the form, or showing a default picture for unknown genres – you can choose.
2. Modify ContentView so that books rated as 1 star have their name shown in red.
3. Add a new “date” attribute to the Book entity, assigning Date() to it so it gets the current date and time, then format that nicely somewhere in DetailView.

<img src="https://user-images.githubusercontent.com/77059554/124910755-99c87e80-dff4-11eb-82a0-bb5ae3616a5d.gif" width="250" height="530" />
