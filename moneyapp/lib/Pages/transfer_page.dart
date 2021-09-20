import 'package:flutter/material.dart';
import 'package:moneyapp/Utils/status_model.dart';
import 'package:moneyapp/Widgets/custom_list_tale.dart';
import 'package:moneyapp/Widgets/custom_tab_bar.dart';

class TransferPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              GradientBackgrounds(size: size),
              MonthBalanceCard(),
              LeftBalanceContainer(),
              Positioned(
                bottom: -20,
                left: 0,
                right: 0,
                height: 160,
                child: HorizontalOptionMenu(),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45.0),
                child: CustomTabBar(),
              ),
            ],
          ),
          HistorialList()
        ],
      ),
    );
  }
}

class HorizontalOptionMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(left: 10),
      scrollDirection: Axis.horizontal,
      children: [
        OptionCard(
          text: "Operar / transacciones",
          icon: Icons.transform_sharp,
          colors: [Colors.indigo[600], Colors.indigo],
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Wrap(
                    children: [
                      ListTile(
                        title: Text("Quiero hacer un ingreso"),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text("Quiero realizar una retirada"),
                        onTap: () {},
                      )
                    ],
                  );
                });
            //Navigator.pushNamed(context, 'operations');
          },
        ),
        OptionCard(
          text: "Organizar un viaje",
          icon: Icons.flight,
          colors: [Colors.indigo[600], Colors.indigo],
          onTap: () {
            print("Viaje");
          },
        ),
        OptionCard(
          text: "Emprender un negocio",
          icon: Icons.account_balance_wallet_outlined,
          colors: [
            Colors.indigo[600],
            Colors.indigo,
          ],
          onTap: () {
            print("Negocio");
          },
        ),
        OptionCard(
          text: "Ahorros personales",
          icon: Icons.attach_money_rounded,
          colors: [
            Colors.indigo[600],
            Colors.indigo,
          ],
          onTap: () {
            print("Ahorros");
          },
        ),
      ],
    );
  }
}

class HistorialList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Historial");
      },
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          CustomListTile(
            icon: Icons.shopping_cart_outlined,
            price: "149.59",
            subtitle: "3:40pm",
            title: "Shopping",
            type: Status.outcome,
          ),
          CustomListTile(
            icon: Icons.monetization_on_outlined,
            price: "100.00",
            subtitle: "2:40pm",
            title: "Ingreso",
            type: Status.income,
          ),
          CustomListTile(
            icon: Icons.fastfood_outlined,
            price: "14.21",
            subtitle: "10:40pm",
            title: "Burguer King",
            type: Status.outcome,
          ),
        ],
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  const OptionCard({
    @required this.text,
    @required this.icon,
    @required this.colors,
    this.onTap,
  });

  final String text;
  final IconData icon;
  final List<Color> colors;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final TextStyle style = TextStyle(
        color: Colors.white, fontSize: 17, fontWeight: FontWeight.normal);

    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        margin: EdgeInsets.only(right: 20),
        width: 135,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: this.colors,
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 8.0, left: 10, right: 10, bottom: 10),
          child: Column(
            children: [
              Text(this.text, style: style),
              Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Icon(this.icon, size: 60, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LeftBalanceContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 45),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Saludo(),
          SizedBox(
            height: 40,
          ),
          Text(
            "Balance total",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "\€3,455.00",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Ingresos extras:",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "+ \€223.74",
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

class MonthBalanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: 75,
      child: Container(
        width: 210,
        height: 220,
        decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BalanceMensualTitle(),
                  SizedBox(
                    height: 15,
                  ),
                  BalanceMensualValue(),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Ultimo movimiento"),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  LastMovimentValue(),
                  SizedBox(
                    height: 20,
                  ),
                  HistorialButton()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HistorialButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("wasap");
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Container(
          child: Center(
            child: Text(
              "Ver Historial",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
          height: 40,
          width: 200,
          decoration: BoxDecoration(
            color: Color.fromRGBO(40, 48, 120, 1),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}

class BalanceMensualTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 2.0),
      child: Row(
        children: [
          Icon(
            Icons.terrain_rounded,
            color: Colors.indigo,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "Balance Mensual",
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class BalanceMensualValue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "\€",
          style: TextStyle(
              color: Colors.green, fontSize: 35, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "242,23",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class LastMovimentValue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.arrow_drop_down_outlined,
          color: Colors.red,
        ),
        Text(
          "149,59",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class Saludo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Hi, Sergio",
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
    );
  }
}

class GradientBackgrounds extends StatelessWidget {
  const GradientBackgrounds({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: size.height * 0.6,
          width: size.width * 0.6,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(49, 57, 140, 1),
                Color.fromRGBO(42, 42, 120, 1),
                Color.fromRGBO(40, 48, 120, 1),
              ],
            ),
          ),
        ),
        Container(
          height: size.height * 0.6,
          width: size.width * 0.4,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(58, 72, 171, 1),
                Color.fromRGBO(55, 60, 120, 1),
              ],
            ),
          ),
        )
      ],
    );
  }
}
