import 'package:car_mobile_project/resources/resources.dart';
import 'package:car_mobile_project/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  List<String> gender = ['None', 'Male', 'Female'];
  String currentGender = 'None';
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
    currentGender = prefs.getString('gender') ?? '';
    await prefs.setString('gender', 'None');
    setState(() {});
  }

  @override
  void dispose() {
    _fullName.dispose();
    _email.dispose();
    _phone.dispose();
    _birthDay.dispose();
    // _gender.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          splashRadius: 1,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            Images.vectorBack,
            scale: 4,
          ),
        ),
        leadingWidth: 95.w,
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
          SizedBox(width: 20.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Text(
              'Profile',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 37.h),
            Text(
              'Full Name:',
              style: GoogleFonts.ptSans(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                  color: AppColors.color2B4C59,
                ),
              ),
            ),
            TextField(
              maxLength: 60,
              decoration: InputDecoration(
                  enabled: isActiveLine,
                  counterText: '',
                  hintText: 'Ivan Ivanuch'),
              controller: _fullName,
            ),
            SizedBox(height: 20.h),
            Text(
              'Email:',
              style: GoogleFonts.ptSans(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                  color: AppColors.color2B4C59,
                ),
              ),
            ),
            TextField(
              maxLength: 50,
              decoration: InputDecoration(
                counterText: '',
                enabled: isActiveLine,
                hintText: 'example@inbox.com/ru',
              ),
              controller: _email,
            ),
            SizedBox(height: 20.h),
            Text(
              'Phone number:',
              style: GoogleFonts.ptSans(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                  color: AppColors.color2B4C59,
                ),
              ),
            ),
            TextField(
              maxLength: 13,
              decoration: InputDecoration(
                counterText: '',
                enabled: isActiveLine,
                hintText: '+996 999 999 999',
              ),
              controller: _phone,
            ),
            SizedBox(height: 20.h),
            Text(
              'Birth Day:',
              style: GoogleFonts.ptSans(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                  color: AppColors.color2B4C59,
                ),
              ),
            ),
            TextField(
              controller: _birthDay,
              decoration: InputDecoration(
                enabled: isActiveLine,
                hintText: '01.02.2000',
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
            SizedBox(height: 20.h),
            if (!isActiveLine)
              DropdownButton(
                onChanged: null,
                value: currentGender,
                items: gender
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
              ),
            if (isActiveLine)
              DropdownButton(
                onChanged: (v) {
                  currentGender = v!;
                  setState(() {});
                },
                value: currentGender,
                items: gender
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
              ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 52.h,
              child: ElevatedButton(
                onPressed: () async {
                  isActiveLine = false;
                  Navigator.pop(context);
                  await prefs.setString('name', _fullName.text);
                  await prefs.setString('email', _email.text);
                  await prefs.setString('number', _phone.text);
                  await prefs.setString('birthDay', _birthDay.text);
                  await prefs.setString('gender', currentGender);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.color2B4C59,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Center(
                  child: Text(
                    'Save Changes',
                    style: GoogleFonts.inconsolata(
                      textStyle: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.colorFFFFFF,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 60.h),
          ],
        ),
      ),
    );
  }
}
