import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:spinwheel/functions/validate_text.dart';
import 'package:spinwheel/widgets/button.dart';

import 'package:spinwheel/widgets/textfield_widget.dart';

class SpinScreen extends StatelessWidget {
SpinScreen({super.key, required this.discount, });


final String discount;

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _numberController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
     
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
                              'result': discount
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
    );
  }
}
