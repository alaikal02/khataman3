import 'package:flutter/material.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

class PageAnggota extends StatefulWidget {
  @override
  _PageAnggotaState createState() => _PageAnggotaState();
}

class _PageAnggotaState extends State<PageAnggota> {
  List<TextEditingController> _controllers = [TextEditingController()];
  List<Widget> _members = [];

  @override
  void initState() {
    super.initState();
    _initializeMemberFields();
  }

  void _initializeMemberFields() {
    _members = [
      MemberInputField(
        hintText: 'Nama',
        controller: _controllers[0],
      ),
    ];
  }

  void _addMemberField() {
    setState(() {
      final newController = TextEditingController();
      _controllers.add(newController);
      _members.insert(
        _members.length - 1,
        MemberInputField(hintText: 'Nama', controller: newController),
      );
    });
  }

  void _saveMembers() {
    List<String> members =
        _controllers.map((controller) => controller.text).toList();
    Navigator.pushNamed(context, '/task', arguments: members);
  }

  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Anggota'),
      ),
      body: KeyboardAvoider(
        autoScroll: true,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Anggota',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ..._members,
              SizedBox(height: 20),
              MemberInputField(
                hintText: 'Tambahkan anggota lain',
                onTap: _addMemberField,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveMembers,
        child: Icon(Icons.save),
        backgroundColor: Colors.green,
      ),
    );
  }
}

class MemberInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final VoidCallback? onTap;

  const MemberInputField({
    Key? key,
    required this.hintText,
    this.controller,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(),
        ),
        onTap: onTap,
      ),
    );
  }
}
