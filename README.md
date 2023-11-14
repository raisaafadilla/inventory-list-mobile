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

## Assignment 8

**The difference between ```Navigator.push()``` and ```Navigator.pushReplacement()```.**

```Navigator.push()``` is used to add a route to be displayed to the user by adding a new page to the navigation stack without removing the previous route. This allows the user to go back to the previous page. For example :
```
Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
```

While, ```Navigator.pushReplacement()``` is used to add a route to be displayed to the user by replacing the current page the user is visiting with a new page on the navigation stack. This prevents the user from going back to the previous page. For example :
```
Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
```

**Layout widget in Flutter.**

1. Drawer: This widget is used to create a slide-in menu that typically appears from the left side of the screen.
2. ListView: A widget used to display child widgets in a scrollable list.
3. DrawerHeader: This widget is used to holding descriptive details such as titles and images.
4. Column: This widget is used to vertically organize and stack widgets within a user interface.
5. Text Widgets: A widget used to show and style text in the app's user interface.
6. Padding: A widget used to set padding or empty space around a child widget.
7. Material: A widget used to makes things look nice and interactive, adding shadows and ripples, following a design style called Material Design.
8. InkWell: This widget is used to makes widgets react when touched.
9. Container: A widget that combines common widgets for drawing, setting placement, and determining size.
10. Center: This widget is used to places its child widget right at the center, making sure it's perfectly aligned both horizontally and vertically.

**The form input elements that used in this assignment.**

In this assignment, I utilized a text input element, namely TextFormField, which serves as a text input field allowing users to input text. It automatically manages various tasks related to text input, such as capturing input, displaying error messages, and providing various validation features.

**The implementation of Clean Architecture in a Flutter application.**

In Flutter, Clean Architecture involves organizing code into three layers:
1. Presentation Layer : It contains UI components and communicates with the domain layer for data.
2. Domain Layer : It defines business logic and use cases, maintaining independence and reusability.
3. Data Layer : It manages data sources and repositories.

That layers is used to improve modularity, maintainability, and testability. This separation of concerns is designed to enhance the codebase's scalability and adaptability to modifications.

**How I Implemented this Assignment**

1. Create one new page in the application, a page for adding a new item.

I created a new file named ```shoplist_form.dart``` in a new folder called ```screens``` within the ```lib``` directory. The TextFormField used will be created to receive three input elements: name, amount, and description.
```
children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Item Name",
                    labelText: "Item Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Name cannot be empty!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Amount",
                    labelText: "Amount",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _amount = int.parse(value!);
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Amount cannot be empty!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Amount must be a number!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Description",
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Description cannot be empty!";
                    }
                    return null;
                  },
                ),
              ),
```

Next, I added the save button.
```
child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Product successfully saved'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Name: $_name'),
                                    Text('Amount: $_amount'),
                                    Text('Description: $_description'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        _formKey.currentState!.reset();
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
```

2. Direct users to the new item addition form page when clicking the Add Item button on the main page.

I added the code below in ```shop_card.dart``` file.
```
// Navigate to the appropriate route (depending on the button type)
          if (item.name == "Add Item") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ShopFormPage()),
            );
          }
```

3. Display data as entered in the form in a pop-up after clicking the Save button on the new item addition page.

I added the code below in ```shoplist_form.dart``` inside the ```screens``` folder.
```
onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Product successfully saved'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Name: $_name'),
                                    Text('Amount: $_amount'),
                                    Text('Description: $_description'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        _formKey.currentState!.reset();
                      }
                    },
```

4. Create a drawer in the application.

I made a new file called ```left_drawer.dart``` inside ```lib/widgets``` folder.
```import 'package:flutter/material.dart';
import 'package:inventory_list_mobile/screens/menu.dart';
import 'package:inventory_list_mobile/screens/shoplist_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              children: [
                Text(
                  'Inventory List',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Write all your list needs here!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home Page'),
            // Redirect to MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Add Items'),
            // Redirect to ShopFormPage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ShopFormPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
```

