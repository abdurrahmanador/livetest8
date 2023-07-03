import 'package:flutter/material.dart';

class ContactHome extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(
      name: 'John Doe',
      email: 'john.doe@example.com',
      phoneNumber: '1234567890',
    ),
    Contact(
      name: 'Jane Smith',
      email: 'jane.smith@example.com',
      phoneNumber: '9876543210',
    ),
    Contact(
      name: 'Robert Johnson',
      email: 'robert.johnson@example.com',
      phoneNumber: '5555555555',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(contacts[index].name),
            onTap: () {
              _showContactDetails(context, contacts[index]);
            },
          );
        },
      ),
    );
  }

  void _showContactDetails(BuildContext context, Contact contact) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                contact.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text('Email: ${contact.email}'),
              SizedBox(height: 8.0),
              Text('Phone: ${contact.phoneNumber}'),
            ],
          ),
        );
      },
    );
  }
}

class Contact {
  final String name;
  final String email;
  final String phoneNumber;

  Contact({
    required this.name,
    required this.email,
    required this.phoneNumber,
  });
}
