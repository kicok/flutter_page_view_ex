import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  InputDecoration inputDecor = InputDecoration(
    labelStyle: const TextStyle(
      color: Colors.deepOrangeAccent,
    ),
    hintStyle: const TextStyle(
      color: Colors.deepOrangeAccent,
    ),
    border: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.deepOrangeAccent,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.deepOrangeAccent,
      ),
    ),
    filled: true,
    fillColor: Colors.amberAccent[100],
  );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FormScreen'),
      ),
      body: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.6,
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              alignment: Alignment.center,
              color: Colors.grey[200],
              child: PageView(
                controller: _pageController,
                onPageChanged: (selectedPage) => currentPage = selectedPage,
                children: [
                  Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextFormField(
                          decoration: inputDecor.copyWith(
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.deepOrangeAccent,
                              ),
                              labelText: 'username',
                              hintText: 'Enter your username'),
                        ),
                        TextFormField(
                          decoration: inputDecor.copyWith(
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.deepOrangeAccent,
                            ),
                            labelText: 'Email',
                            hintText: 'Enter your Email',
                          ),
                        ),
                        TextFormField(
                          decoration: inputDecor.copyWith(
                            prefixIcon: const Icon(
                              Icons.vpn_key,
                              color: Colors.deepOrangeAccent,
                            ),
                            labelText: 'Password',
                            hintText: 'Enter your Password',
                          ),
                        ),
                        TextFormField(
                          decoration: inputDecor.copyWith(
                            prefixIcon: const Icon(
                              Icons.vpn_key,
                              color: Colors.deepOrangeAccent,
                            ),
                            labelText: 'Confirm Password',
                            hintText: 'Enter your Confirm Password',
                          ),
                        ),
                        ButtonBar(
                          children: [
                            MaterialButton(
                              color: Colors.deepPurpleAccent,
                              minWidth: 100,
                              height: 40,
                              elevation: 9,
                              child: const Text(
                                'Next',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                _pageController.jumpToPage(1);
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextFormField(
                          decoration: inputDecor.copyWith(
                            prefixIcon: Icon(
                              FontAwesomeIcons.facebookSquare,
                              color: Colors.blueAccent[700],
                            ),
                            labelText: 'Facebook',
                            hintText: 'Enter your facebook handle',
                          ),
                        ),
                        TextFormField(
                          decoration: inputDecor.copyWith(
                            prefixIcon: Icon(
                              FontAwesomeIcons.instagram,
                              color: Colors.blueAccent[700],
                            ),
                            labelText: 'Instagram',
                            hintText: 'Enter your Instagram handle',
                          ),
                        ),
                        TextFormField(
                          decoration: inputDecor.copyWith(
                            prefixIcon: Icon(
                              FontAwesomeIcons.twitter,
                              color: Colors.blueAccent[700],
                            ),
                            labelText: 'Twitter',
                            hintText: 'Enter your Twitter handle',
                          ),
                        ),
                        ButtonBar(
                          children: [
                            MaterialButton(
                              color: Colors.deepPurpleAccent,
                              minWidth: 100,
                              height: 40,
                              elevation: 9,
                              child: const Text(
                                'Previous',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                _pageController.jumpToPage(0);
                              },
                            ),
                            MaterialButton(
                              color: Colors.deepPurpleAccent,
                              minWidth: 100,
                              height: 40,
                              elevation: 9,
                              onPressed: () {},
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )),
          const Divider(),
          const SizedBox(height: 15),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  '1. Basic info',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                Icon(Icons.arrow_forward_ios),
                Text(
                  '2. Bio',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
