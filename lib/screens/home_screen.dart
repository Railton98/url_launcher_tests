import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('URL Launcher Methods')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(onPressed: _launchURL, child: Text('Flutter Site'), color: Colors.cyanAccent),
            RaisedButton(onPressed: _launchSMS, child: Text('SMS'), color: Colors.grey),
            RaisedButton(onPressed: _launchTel, child: Text('Phone'), color: Colors.blueAccent),
            RaisedButton(onPressed: _launchWhatsApp, child: Text('WhatsApp'), color: Colors.greenAccent),
            RaisedButton(onPressed: _launchEmail, child: Text('Email'), color: Colors.redAccent),
          ],
        ),
      ),
    );
  }

  void _launchURL() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchSMS() async {
    const smsUrl = 'sms:123912345678';
    if (await canLaunch(smsUrl)) {
      await launch(smsUrl);
    } else {
      throw 'Could not launch $smsUrl';
    }
  }

  void _launchTel() async {
    const smsUrl = 'tel:+123912345678';
    if (await canLaunch(smsUrl)) {
      await launch(smsUrl);
    } else {
      throw 'Could not launch $smsUrl';
    }
  }

  void _launchWhatsApp() async {
    const String phoneNumber = '+123912345678';
    const String message = 'hello from flutter app!!';
    final whatsappUrl = "whatsapp://send?phone=$phoneNumber&text=$message";
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }

  void _launchEmail() async {
    const String emailAddress = 'username@email.com';
    const String subject = 'hello from flutter app!!';
    const String body = 'teste';
    final emailUrl = "mailto:$emailAddress?subject=$subject&body=$body";
    if (await canLaunch(emailUrl)) {
      await launch(emailUrl);
    } else {
      throw 'Could not launch $emailUrl';
    }
  }
}
