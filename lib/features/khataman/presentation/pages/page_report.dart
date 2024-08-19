import 'package:flutter/material.dart';

class PageReport extends StatefulWidget {
  final Map<String, List<bool>> tasks;

  PageReport({required this.tasks});

  @override
  _PageReportState createState() => _PageReportState();
}

class _PageReportState extends State<PageReport> {
  String _selectedPeriode = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Periode:',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(width: 10),
                DropdownButton<String>(
                  value: _selectedPeriode,
                  items: List.generate(12, (index) {
                    return DropdownMenuItem<String>(
                      value: '${index + 1}',
                      child: Text('Periode ${index + 1}'),
                    );
                  }),
                  onChanged: (value) {
                    setState(() {
                      _selectedPeriode = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.5,
                ),
                itemCount: 30,
                itemBuilder: (context, index) {
                  bool isChecked = false;
                  widget.tasks.forEach((member, tasks) {
                    if (index < tasks.length && tasks[index]) {
                      isChecked = true;
                    }
                  });
                  return Column(
                    children: [
                      Text('Juz ${index + 1}'),
                      Checkbox(
                        value: isChecked,
                        onChanged: (value) {},
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
