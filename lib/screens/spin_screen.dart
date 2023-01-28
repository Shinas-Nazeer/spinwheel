import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spinwheel/constants/color.dart';
import 'package:spinwheel/functions/validate_text.dart';
import 'package:spinwheel/widgets/button.dart';
import 'package:spinwheel/widgets/spin_widget.dart';
import 'package:spinwheel/widgets/textfield_widget.dart';

class SpinScreen extends StatefulWidget {
  const SpinScreen({super.key});

  @override
  State<SpinScreen> createState() => _SpinScreenState();
}

class _SpinScreenState extends State<SpinScreen> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _numberController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title: ListTile(
        textColor: kWhite,
        iconColor: Colors.green,
        title: Row(
          children: const [
            Text('SPIN TO WIN'),
            Icon(
              Icons.circle,
              size: 14.0,
            )
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            kSizedbox,
            Text(
              'Do you want 30% discount Spin here to get your discouts',
              style: TextStyle(fontSize: 10),
            ),
            kSizedbox
          ],
        ),
      )),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: SpinWidjet(),
              ),
              TextField1(
                labelText: 'Full Name',
                controller: _nameController,
                validatetextfield: ValidateTextForm.validate,
                upperText: 'Full Name',
              ),
              TextField1(
                labelText: 'Phone Number',
                controller: _numberController,
                validatetextfield: ValidateTextForm.validatePhone,
                upperText: 'Phone Number',
              ),
              TextField1(
                labelText: 'Email',
                controller: _emailController,
                validatetextfield: ValidateTextForm.validateEmail,
                upperText: 'Email',
              ),
              Row(
                children: [
                  Button(
                      label: 'TRY YOUR LUCKY',
                      onClicked: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            await FirebaseFirestore.instance
                                .collection('user')
                                .doc()
                                .set(({
                                  'name': _nameController.text,
                                  'number': _numberController.text,
                                  'email': _emailController.text,
                                }));
                            _nameController.clear();
                            _emailController.clear();
                            _numberController.clear();
                          } catch (e) {
                            print(e);
                          }
                        }
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
