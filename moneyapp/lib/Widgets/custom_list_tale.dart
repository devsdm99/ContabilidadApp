import 'package:flutter/material.dart';
import 'package:moneyapp/Utils/status_model.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String price;
  final Status type;

  const CustomListTile({
    this.icon,
    this.price,
    this.title,
    this.subtitle,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle trailingStyle = TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);
    final TextStyle titleStyle = TextStyle(fontSize: 15, color: Colors.black);

    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundColor:
            this.type == Status.income ? Colors.green[100] : Colors.red[100],
        child: Icon(
          this.icon,
          color: this.type == Status.income ? Colors.green : Colors.red,
        ),
      ),
      title: Text(
        this.title,
        style: titleStyle,
      ),
      subtitle: Text(this.subtitle),
      trailing: Text('${this.type == Status.income ? "+" : "-"}' + this.price,
          style: trailingStyle),
    );
  }
}
