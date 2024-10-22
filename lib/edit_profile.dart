import 'dart:io';

import 'package:flutter/material.dart';
import 'package:profile_page_layout/profile_info_page.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none, // Ensures the image can overflow out of the container
              children: [
                // Main Container
                Container(
                  height: 240,
                  width: double.infinity,
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        Row(
                          children: [
                            IconButton(
                              icon:  const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 15),
                              onPressed: () {
                                Navigator.pop(context); // Back navigation
                              },
                            ),
                            const Spacer(),
                            const Text(
                              "Edit Profile",
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Positioned Image at the top center
                Positioned(
                  top: 120, // Adjust this value to control how much the image overflows
                  left: 0,
                  right: 0,
                  child: Center(
                    child: CircleAvatar(
                      radius: 55, // Adjust the radius as needed
                      backgroundImage: AssetImage('asset/images/profile_pic.png'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10), // Adjust to give enough space for the image
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ListView(
                  children: [

                    ProfileInfoPage(
                      label: 'Name',
                      initialValue: 'Lochan chugh',
                    ),
                    ProfileInfoPage(
                      label: 'Email',
                      initialValue: 'lochanchugh143@gmail.com',
                    ),
                    ProfileInfoPage(
                      label: 'Phone',
                      initialValue: '887902355568',
                    ),
                  ],
                ), // Your custom profile info page
              ),
            ),
          ],
        ),
      ),
    );
  }
}
