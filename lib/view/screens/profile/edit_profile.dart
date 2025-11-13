
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller Find
    // final UserController controller = Get.find<UserController>();
    final Color primaryColor = const Color(0xFF9386E8);


    final TextEditingController NameController = TextEditingController(text: 'Zakaria Rabby');
    final TextEditingController EmailController = TextEditingController(text: 'name@example.com');
    final TextEditingController PhoneController = TextEditingController(text: '+880 1453-687533');
    final TextEditingController CountryController = TextEditingController(text: 'Bangladesh');
    final TextEditingController CityController = TextEditingController(text: 'Sylhet');
    final TextEditingController AddressController = TextEditingController(text: 'Chhatak, Sunamgonj 12/8AB');


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text('Account Information', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- Profile Picture with Edit Icon ---
                  Center(
                    child: Stack(
                      children: [
                        const _ProfilePicture(imageUrl: 'assets/images/profile.png'),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: primaryColor,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(Icons.edit, color: Colors.white, size: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),

                  // --- Form Fields ---
                  _LabelText('Name'),
                  _CustomEditableTextField(hintText: 'Zakaria Rabby', controller:NameController),

                  _LabelText('Email'),
                  _CustomEditableTextField(hintText: 'name@example.com', controller: EmailController, isEmail: true),

                  _LabelText('Phone Number'),
                  _CustomEditableTextField(hintText: '+880 1453-687533', controller: PhoneController, keyboardType: TextInputType.phone),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _LabelText('Country'),
                            _CustomEditableTextField(hintText: 'Bangladesh', controller: CountryController),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _LabelText('City'),
                            _CustomEditableTextField(hintText: 'Sylhet', controller: CityController),
                          ],
                        ),
                      ),
                    ],
                  ),

                  _LabelText('Address'),
                  _CustomEditableTextField(hintText: 'Chhatak, Sunamgonj 12/8AB', controller: AddressController),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),

          // --- Save Changes Button  ---
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(

                onPressed: () => print("Saving changes and returning (Screen 20)"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  'Save Changes',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ----------------------------------------------------------------------
// --- Helper Widgets for Screen 21 (Editable) ---
// ----------------------------------------------------------------------

class _LabelText extends StatelessWidget {
  final String text;
  const _LabelText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 8.0),
      child: Text(text, style: const TextStyle(fontSize: 14, color: Colors.black)),
    );
  }
}

class _CustomEditableTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isEmail;

  const _CustomEditableTextField({
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isEmail = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: isEmail ? const Icon(Icons.lock_outline, color: Colors.grey) : null,
          hintStyle: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.w500),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        ),
      ),
    );
  }
}


// Reusable Profile Picture Widget
class _ProfilePicture extends StatelessWidget {
  final String imageUrl;

  const _ProfilePicture({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade200, width: 3),
      ),
      child: ClipOval(
        child: Image.asset(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => const Icon(
            Icons.person,
            size: 60,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}