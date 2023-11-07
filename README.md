# inventory_list_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Assignment 7

**The main differences between stateless and stateful widget in Flutter.**

Stateless widgets in Flutter are the widgets that do not change their appearance or properties while the app is running, which means the widgets cannot be redrawn or updated while the app is in action. Whereas, stateful widgets are dynamic and can transform multiple times while the app is running, so these widgets can be redrawn or updated in response to different actions. Therefore, stateful widgets are more flexible and adaptable. 

**Widgets that used in this assignment.**

1. MyApp (Stateless Widget): This widget prepares the setup for the whole app. It gives back a MaterialApp, which is a predefined Flutter widget that offers various settings to style and control how the app appears and behaves.
2. MyHomePage (Stateless Widget): This widget defines how the main screen looks by arranging an organized view with a top bar, a scrollable area, a title, and a grid-style layout to show a bunch of things (represented by InventoryItem objects) as ShopCard widgets.
3. ShopCard (Stateless Widget): This widget puts together how a single inventory item looks like as a card, displaying an icon and the item's name. It also enables interaction by responding to taps, showing a brief message (SnackBar) about the specific item when clicked.

**How I Implemented this Assignment**

1. Creating new flutter application

I created a new flutter app by running ```flutter create inventory_list_mobile``` on my terminal.

After that, I opened the file on VS Code and edited a several code :
1) In lib file, I created menu.dart file. I moved several code on the main.dart file.
2) In main.dart file, I replaced the Material Color code with ```primarySwatch: Colors.indigo``` and changed ```MyHomePage(title: 'Flutter Demo Home Page')``` with ```MyHomePage()```
3) In menu.dart file, I changed ```({super.key, required this.title})``` with ```({Key? key}) : super(key: key);```. Then, I removed ```final String title;``` and added the Widget build method.

2. Creating 3 simple buttons with icon and text

I created the type of items on my inventory by defining the type in my list :
```
class InventoryItem {
  final String name;
  final IconData icon;
  final Color color;

  InventoryItem(this.name, this.icon, this.color);
}
```

Then, I added the items :
```
final List<InventoryItem> items = [
    InventoryItem("View Items", Icons.checklist, Colors.red),
    InventoryItem("Add Item", Icons.add_shopping_cart, Colors.blue),
    InventoryItem("Logout", Icons.logout, Colors.yellow),
  ];
```

After that, I added this following code inside the Widget built method :
```
return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Inventory',
        ),
      ),
      body: SingleChildScrollView(
        // Scrolling wrapper widget
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding for the page
          child: Column(
            // Widget to display children vertically
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Text widget to display text with center alignment and appropriate style
                child: Text(
                  'Inventory List', // Text indicating the shop name
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container for our cards.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((InventoryItem item) {
                  // Iteration for each item
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

3. Creating a Snackbar

I added this stateless widget to display the card and created the Snackbar.
```
class ShopCard extends StatelessWidget {
  final InventoryItem item;

  const ShopCard(this.item, {Key? key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Responsive touch area
        onTap: () {
          // Show a SnackBar when clicked
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("You clicked the ${item.name} button")));
        },
        child: Container(
          // Container to hold Icon and Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```



