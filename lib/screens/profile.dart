import 'package:car_mobile_project/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final SharedPreferences prefs;
  late final _fullName = TextEditingController();
  late final _email = TextEditingController();
  late final _phone = TextEditingController();
  late final _birthDay = TextEditingController();
  late final _gender = TextEditingController();
  bool isActiveLine = false;

  @override
  void initState() {
    initPrefs();
    super.initState();
  }

  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    _fullName.text = prefs.getString('name') ?? '';
    _email.text = prefs.getString('email') ?? '';
    _phone.text = prefs.getString('number') ?? '';
    _birthDay.text = prefs.getString('birthDay') ?? '';
    _gender.text = prefs.getString('gender') ?? '';
    setState(() {});
  }

  @override
  void dispose() {
    _fullName.dispose();
    _email.dispose();
    _phone.dispose();
    _birthDay.dispose();
    _gender.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            Images.vectorBack,
            scale: 4,
          ),
        ),
        leadingWidth: 95,
        actions: [
          IconButton(
            splashRadius: 20,
            onPressed: () {
              setState(() {});
              isActiveLine = true;
            },
            icon: Image.asset(
              Images.pen,
              scale: 3.5,
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text(
                'Profile',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 37),
              Text(
                'Full Name:',
                style: GoogleFonts.ptSans(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xff2B4C59),
                  ),
                ),
              ),
              TextField(
                maxLength: 60,
                decoration: InputDecoration(
                    enabled: isActiveLine,
                    counterText: '',
                    labelText: _fullName.text.isNotEmpty ? '' : 'Ivan Ivanuch'),
                controller: _fullName,
              ),
              const SizedBox(height: 20),
              Text(
                'Email:',
                style: GoogleFonts.ptSans(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xff2B4C59),
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  enabled: isActiveLine,
                  labelText:
                      _email.text.isNotEmpty ? '' : 'example@inbox.com/ru',
                ),
                controller: _email,
              ),
              const SizedBox(height: 20),
              Text(
                'Phone number:',
                style: GoogleFonts.ptSans(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xff2B4C59),
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  enabled: isActiveLine,
                  labelText: _phone.text.isNotEmpty ? '' : '+996 999 999 999',
                ),
                controller: _phone,
              ),
              const SizedBox(height: 20),
              Text(
                'Birth Day:',
                style: GoogleFonts.ptSans(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xff2B4C59),
                  ),
                ),
              ),
              TextField(
                controller: _birthDay,
                decoration: InputDecoration(
                  enabled: isActiveLine,
                  labelText: _birthDay.text.isNotEmpty ? '' : '01.02.2000',
                ),
                onTap: () async {
                  DateTime? pickedData = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2040));
                  if (pickedData != null) {
                    setState(() {
                      _birthDay.text =
                          DateFormat('dd-MM-yyyy').format(pickedData);
                    });
                  }
                },
              ),
              const SizedBox(height: 20),
              Text(
                'Gender:',
                style: GoogleFonts.ptSans(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xff2B4C59),
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  enabled: isActiveLine,
                  labelText: _gender.text.isNotEmpty ? '' : 'Male/Female',
                ),
                controller: _gender,
              ),
              const SizedBox(height: 115),
              TextButton(
                onPressed: () async {
                  isActiveLine = false;
                  Navigator.pop(context);
                  await prefs.setString('name', _fullName.text);
                  await prefs.setString('email', _email.text);
                  await prefs.setString('number', _phone.text);
                  await prefs.setString('birthDay', _birthDay.text);
                  await prefs.setString('gender', _gender.text);
                },
                child: Container(
                  height: 52,
                  width: 349,
                  decoration: const BoxDecoration(
                    color: Color(0xff2B4C59),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Save Changes',
                      style: GoogleFonts.inconsolata(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
