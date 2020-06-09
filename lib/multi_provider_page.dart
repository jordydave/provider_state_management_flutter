import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas11/cart.dart';
import 'package:tugas11/money.dart';

class MultiProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<Money>(
            create: (context) => Money(),
          ),
          ChangeNotifierProvider<Cart>(
            create: (context) => Cart(),
          ),
        ],
        child: Scaffold(
          floatingActionButton: Consumer<Cart>(
            builder: (context, cart, _) => Consumer<Money>(
              builder: (context, money, _) => FloatingActionButton(
                onPressed: () {
                  if (money.balance >= 500) cart.quantity += 1;
                  money.balance -= 500;
                },
                child: Icon(
                  Icons.add_shopping_cart,
                ),
                backgroundColor: Colors.amber,
              ),
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.lightBlue,
            elevation: 0,
            title: Row(
              children: <Widget>[
                Icon(
                  Icons.add_shopping_cart,
                  color: Colors.amber,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Jordy",
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  "Dave",
                  style: TextStyle(color: Colors.pink),
                ),
              ],
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Balance",
                      style: TextStyle(
                        color: Colors.lightBlue,
                      ),
                    ),
                    Container(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Consumer<Money>(
                          builder: (context, money, _) => Text(
                            money.balance.toString(),
                            style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      height: 30,
                      width: 150,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.lightBlue,
                        border: Border.all(
                          color: Colors.amber,
                          width: 2,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Consumer<Cart>(
                      builder: (context, cart, _) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Apple(500) x " + cart.quantity.toString(),
                            style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            (500 * cart.quantity).toString(),
                            style: TextStyle(
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  height: 30,
                  margin: EdgeInsets.all(6),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.lightBlue,
                      width: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
