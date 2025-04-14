import 'package:bal_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  Widget mission() {
    return const Text(
        'Our Mission: To harness, equip, guide and prosper young talent for prosperity, one season round at a time!');
  }

  Widget vision() {
    return const Text(
        '\n Our Vision: Specialization for efficient and sustainable development, saving your time and resources.');
  }

  Widget aboutUsSizedBox() {
    return const SizedBox(
      width: 1.3,
      height: 1.3,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "About Us",
          backgroundColor: Colors.purpleAccent,
          leading: const Image(image: AssetImage('logo-black.png')),
          actions: const [
            Text("Meet the team..."),
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            aboutUsSizedBox(),
            const Card(
              child: Text("BAL Africa"),
            ),
            aboutUsSizedBox(),
            mission(),
            aboutUsSizedBox(),
            vision(),
            aboutUsSizedBox(),
            const Card(
              child: Text(' What we do '),
            ),
            const Card(
              child: Text(
                  'We are an online sports management team aiming at employing the youth to support the young community.'),
            ),
            const Card(
              child: Text(
                  'This app is a one stop ticket shop for an easy wash on the go.'),
            ),
            const Card(
              child: Text(
                  ' Giving 30% of our net profits to foundations in support of the unpriviledged. We strive to operate with utmost speed and care to deliver on time.'),
            ),
            const Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Image(image: AssetImage('assets/images/car.jpg')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
