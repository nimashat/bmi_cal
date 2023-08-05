import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late DateTime selectedDate;
  String dob = '';
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String selectedGender = '';

  int calculateAge(DateTime selectedDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - selectedDate.year;
    if (currentDate.month < selectedDate.month ||
        (currentDate.month == selectedDate.month &&
            currentDate.day < selectedDate.day)) {
      age--;
    }
    return age;
  }

  double calculateBMI(double height, double weight) {
    return weight / ((height / 100) * (height / 100));
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Date of Birth:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      DatePicker.showDatePicker(
                        context,
                        showTitleActions: true,
                        onChanged: (date) {
                          setState(() {
                            selectedDate = date;
                            dob = date.toString().split(' ')[0];
                          });
                        },
                        onConfirm: (date) {
                          setState(() {
                            selectedDate = date;
                            dob = date.toString().split(' ')[0];
                          });
                        },
                      );
                    },
                    child: Text(
                      'Select Date',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(dob),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'Name:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(fontSize: 16),
                      controller: nameController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'Address:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(fontSize: 16),
                      controller: addressController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'Height (cm):',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(fontSize: 16),
                      keyboardType: TextInputType.number,
                      controller: heightController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'Weight (kg):',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(fontSize: 16),
                      keyboardType: TextInputType.number,
                      controller: weightController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Gender:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Male',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value!;
                          });
                        },
                      ),
                      Text('Male'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Female',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value!;
                          });
                        },
                      ),
                      Text('Female'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Age and BMI'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Age: ${calculateAge(selectedDate)}'),
                          Text('Name:${nameController.text}'),
                          Text('Adress:${addressController.text}'),
                          SizedBox(height: 10),
                          Text(
                              'Your BMI is ${calculateBMI(double.parse(heightController.text), double.parse(weightController.text)).toStringAsFixed(2)}'),
                          SizedBox(height: 10),
                          Text('Gender: $selectedGender'),
                          SizedBox(height: 10),
                           Builder(
              builder: (BuildContext context) {
                final bmi = calculateBMI(
                  double.parse(heightController.text),
                  double.parse(weightController.text),
                );
                String comment;

                if (bmi < 18.5) {
                  comment = 'Underweight';
                } else if (bmi >= 18.5 && bmi < 25) {
                  comment = 'Normal weight';
                } else if (bmi >= 25 && bmi < 30) {
                  comment = 'Overweight';
                } else {
                  comment = 'Obese';
                }

                return Text('BMI Comment: $comment');
              },
                      )],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text('Calculate Age and BMI'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
