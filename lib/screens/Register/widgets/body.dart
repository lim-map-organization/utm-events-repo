import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Text(
            'APPOINTMENT WITH US!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: 'Full Name',
              hintText: 'Enter your fullname.',
              icon: Icon(Icons.people)
            ),
            onChanged: (val) {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your email.',
              icon: Icon(Icons.email)
            ),
            onChanged: (val) {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: 'Phone number',
              hintText: 'Enter your phone number.',
              icon: Icon(Icons.phone)
            ),
            onChanged: (val) {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: 'Password',
              hintText: 'Enter your password.',
              icon: Icon(Icons.lock)
            ),
            obscureText: true,
            onChanged: (val) {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: 'Password Confirmation',
              hintText: 'Enter your password.',
              icon: Icon(Icons.lock)
            ),
            obscureText: true,
            onChanged: (val) {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: DropdownButtonFormField(
            decoration: const InputDecoration(
              labelText: 'Role',
              hintText: 'Pick your role.',
            ),
            items: [
              DropdownMenuItem(
                child: Text('Student'),
                value: 1,
              ),
              DropdownMenuItem(
                child: Text('Staff'),
                value: 2,
              ),
            ],
            onChanged: (val) {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: DropdownButtonFormField(
            decoration: const InputDecoration(
              labelText: 'Faculty/School',
              hintText: 'Pick your faculty/school.',
            ),
            items: [
              DropdownMenuItem(
                child: Text('School of Computing'),
                value: 1,
              ),
              DropdownMenuItem(
                child: Text('School of Civil Engineering'),
                value: 2,
              ),
              DropdownMenuItem(
                child: Text('School of Electrical Engineering'),
                value: 3,
              ),
              DropdownMenuItem(
                child: Text('School of Mechanical Engineering'),
                value: 4,
              ),
              DropdownMenuItem(
                child: Text('School of Chemical and Energy Engineering'),
                value: 5,
              ),
              DropdownMenuItem(
                child: Text('School of Biosciences & Medical Engineering'),
                value: 6,
              ),
            ],
            onChanged: (val) {},
          ),
        ),
        SizedBox(height: 30.0),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                  child: Text('Register'),
                  onPressed: () {},
                ),
              ),
            ),
          ]
        ),
      ],
    );
  }
}