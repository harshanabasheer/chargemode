import 'package:chargemode/controller/auth_controller.dart';
import 'package:chargemode/screens/bottombar.dart';
import 'package:chargemode/screens/login.dart';
import 'package:chargemode/services/preference_service.dart';
import 'package:chargemode/utils/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    context.read<AuthController>().fetchData(context);
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var provider=context.watch<AuthController>();
    return  provider.loading ? Center(child: CircularProgressIndicator(color: AppColor.primaryColor,),) : Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Hello',
                        style: Theme.of(context).textTheme.bodyMedium),
                    provider.user!=null?   Text(provider.user?["firstName"],
                        style: Theme.of(context).textTheme.bodyLarge) : Text('no user')
                  ],
                ),
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/images/profile.png',
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Card(
                child: Column(
                  children: [
                    _buildSection(
                        'My Payments',
                        AssetImage(
                          'assets/images/payments.png',
                        )),
                    Divider(),
                    _buildSection(
                      'My Electric Vehicles',
                      AssetImage('assets/images/ev.png'),
                    ),
                    Divider(),
                    _buildSection('My Favorite Stations',
                        AssetImage('assets/images/fav.png')),
                    Divider(),
                    _buildSection('Alpha Membership',
                        AssetImage('assets/images/alpha.png')),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColor.primaryColor,
                ),
                onPressed: () {},
                child: Text(
                  'Buy Machines From chargeMOD',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColor.primaryColorLight_l),
                ),
              ),
              SizedBox(height: 10),
              Card(
                child: Column(
                  children: [
                    _buildSection(
                        'My Devices',
                        AssetImage(
                          'assets/images/devices.png',
                        )),
                    Divider(),
                    _buildSection(
                      'My Orders',
                      AssetImage('assets/images/orders.png'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Card(
                child: Column(
                  children: [
                    _buildSection(
                        'Help',
                        AssetImage(
                          'assets/images/help.png',
                        )),
                    Divider(),
                    _buildSection(
                      'Raise Complaint',
                      AssetImage('assets/images/rase.png'),
                    ),
                    Divider(),
                    _buildSection(
                        'About Us', AssetImage('assets/images/about.png')),
                    Divider(),
                    _buildSection('Privacy Policy',
                        AssetImage('assets/images/privacy.png')),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColor.primaryColor,
                ),
                onPressed: ()  {
                  context
                      .read<AuthController>()
                      .logOut(context);

                },
                child: Consumer<AuthController>(
                  builder: (context, provider, child) {
                    return provider.loading
                        ? CircularProgressIndicator(
                      color: Colors.white,
                    )
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.power_settings_new_rounded,
                          color: Colors.white,
                        ),
                        Text('Logout',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: AppColor.primaryColorLight_l)),
                      ],
                    );
                  }
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 100,
                child: Center(
                  child: Image.asset(
                    'assets/images/image.png',
                    height: 80,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.center,
                  child: Text('Copyright © 2022 BPM Power Pvt Ltd.',
                      style: Theme.of(context).textTheme.bodySmall)),
              Align(
                  alignment: Alignment.center,
                  child: Text('All rights reserved.',
                      style: Theme.of(context).textTheme.bodySmall))
            ],
          ),
        ),
      );

  }

  Widget _buildSection(String text, image) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 30, // Set your desired width
            height: 30, // Set your desired height
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: image,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          SizedBox(width: 10),
          Text(text),
          Spacer(),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
