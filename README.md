# UTM-EVENTS
UTM EVENTS is a mobile application that allows the students to make their appointments and get approval for the events. 

## Sprint 1 : Login or Sign Up Subsystem
Include ID01 - Login & ID02 Sign Up
Folder: screen/authenticate

### 1. Empty Screen
Empty Screen serves as the main screen for the authentication page.\
-> It can redirect to the "Login" or "Register".\
-> Separated into 3 parts\
A. empty_screen.dart: It is the main page for the empty screen\
B. body.dart: It is the body part (icons and the 2 buttons) in the empty screen.\
C. row_button.dart: It is the pair button showing the "Login" and "Register". 

### 2. Login Screen
The login screen serves as the login screen which has the email and password for login purpose. \
-> It shows the error if there is an error in the input using the form key. \
-> Separates into 3 parts
A. bar.dart: It is the app bar for the login screen.\
B. body.dart: It is the body part (forms and buttons) in the login screen.\
C. login_screen.dart: It is the main page for the login screen.\
 
### 3. Register Screen
The register screen serves as the register screen which has the input needed (email, password, username, 
-> It shows the error if there is an error in the input using the form key. \
-> Separates into 3 parts
A. bar.dart: It is the app bar for the register screen.\
B. body.dart: It is the body part (forms and buttons) in the register screen.\
C. register_screen.dart: It is the main page for the register screen.\
D. widget/head_part.dart: It is the image and the header for the register screen.

```

## Sprint 2 : Appointment & Emergency Call
Include UC006 - Check Treatment Schedule, UC007 - Make an Appointment, UC010 - Call Emergency Service
```
Version 2.0 : Appointment 
☠️ Problem : Database arrangement for the appointment 

Version 2.1 : Appointment (Database Fixed)
🦾 Upgrade: Implement the appointment + unique ID for each database

Version 2.2 : Emergency Call (Finalize)
🦾 Upgrade: Improve the Graphical User Interface for emergency Call

```
## Sprint 3
Include UC008 - Make an Online Payment, UC009 - Check Payment, UC011 - View Health Report
```
Version 3.0 : Health Report & Payment 
💀 Bug: Different payment method does not show the respective payment details
(Ex. E-wallet => Show the mobile number and the type of e-wallet used)

Version 3.1 : Payment (Fixed Bug)
🦾 Upgrade: Change the Bill class into Stateful widget

```

## Sprint 4
Bug Tracking and Final Touch Up
```
Version 4.0 : Final Touch Up
🦾 Upgrade: Linkthe setting page into more functional page 

Version 4.1 : Final Touch Up (Home Page)
🦾 Upgrade: Link the important info to the home page

```

