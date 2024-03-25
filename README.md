# learn_provider

Let’s say you have an app and you have multiple different pages. You have to start thinking about how are you going to organize the data so you can provide the correct information to each page. Now in flutter the default way is to use set state to reflect any changes in the data and set state pretty much just asks the app to rebuild the widget with the new change but let’s say we have a shop app and you can add items to the cart.

So, from the shop page you can navigate to another page like to individual item page or to cart page. Now it seems reasonable to have all the data at the top level in the shop page and pass them down to the next page as you need to.

as the app grows to multiple pages what ends up happening is you get this sort of tree architecture and this is bad for a few reasons when any changes made because all of the data is controlled from the top of the level, it may be expensive for the performance to rebuild the entire widget tree every time also your code is going to get cluttered overtime and it’s going to be hard to see how the data flows through your app.

So instead of this tree architecture, let’s just lay out the pages side by side and create a seperate layer called provider and this can give each page whatever it needs whenever it nedds. This will make your life so much easier as you scale up the app

# Source??

https://medium.com/flutter-community/flutter-state-management-with-provider-notifylisteners-x-streamprovider-part-1-edba795d4937

https://www.youtube.com/watch?v=uQuxrZE2dqA&t=77s&pp=ygUQc3RhdGUgaW4gZmx1dHRlcg%3D%3D
