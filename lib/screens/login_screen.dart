import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                // Top Image (Takes 35% of Screen Height)
                Container(
                  width: double.infinity,
                  height: screenHeight * 0.35,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/ateneo.jpeg"), // Ensure it's added in pubspec.yaml
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Login Form (65% of Screen Height)
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.03,
                      horizontal: screenWidth * 0.08),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Logo & Title
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Color(0xFF018cad),
                            radius: 18,
                            child: Icon(Icons.security,
                                color: Colors.white, size: 18),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Bataga, Hitgano",
                            style: TextStyle(
                                fontSize: screenWidth * 0.05,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "- ITE5",
                            style: TextStyle(
                                fontSize: screenWidth * 0.035,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.02),

                      // Login Text
                      Text(
                        "Ateneo de Davao University Daigler - Moodle",
                        style: TextStyle(
                            fontSize: screenWidth * 0.06,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Divider(color: Colors.grey.shade300),

                      // Login Form (Scrollable)
                      ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          // Email Input
                          Text("Email / Username",
                              style: TextStyle(
                                  fontSize: screenWidth * 0.035,
                                  color: Colors.grey)),
                          SizedBox(height: 8),
                          TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person_outline),
                              hintText: "flutter@addu.edu.ph",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(55),
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.015),

                          // Password Input
                          Text("Password",
                              style: TextStyle(
                                  fontSize: screenWidth * 0.035,
                                  color: Colors.grey)),
                          SizedBox(height: 8),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock_outline),
                              hintText: "••••••••",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.015),

                          // Auto Login & Forgot Password
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(value: true, onChanged: (value) {}),
                                  Text("Auto Login"),
                                ],
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text("Forgot Password?",
                                    style: TextStyle(color: Colors.blue)),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.015),

                          // Log In Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFF76300),
                                padding: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.018),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                elevation: 5,
                              ),
                              onPressed: () {
                                // Example Navigation (Change this later)
                                Navigator.pushNamed(context, '/dashboard');
                              },
                              child: Text("Log in",
                                  style: TextStyle(
                                      fontSize: screenWidth * 0.045,
                                      color: Colors.white)),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),

                          // Register Link
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("No Account Yet? "),
                              TextButton(
                                onPressed: () {},
                                child: Text("Register >",
                                    style: TextStyle(color: Color(0xFF018cad))),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.03),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
