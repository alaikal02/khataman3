import 'package:flutter/material.dart';

class PageTask extends StatefulWidget {
  final List<String> members;

  PageTask({required this.members});

  @override
  _PageTaskState createState() => _PageTaskState();
}

class _PageTaskState extends State<PageTask> {
  String _selectedPeriode = '1';
  Map<String, List<bool>> _tasks = {};

  @override
  void initState() {
    super.initState();
    _initializeTasks();
  }

  void _initializeTasks() {
    int totalJuz = 30;
    int membersCount = widget.members.length;
    int taskPerMember = (totalJuz / membersCount).floor();
    int remainingTasks = totalJuz % membersCount;

    for (int i = 0; i < widget.members.length; i++) {
      List<bool> taskStatus = List.generate(taskPerMember, (_) => false);
      if (remainingTasks > 0) {
        taskStatus
            .add(false); 
        remainingTasks--;
      }
      _tasks[widget.members[i]] = taskStatus;
    }
  }

  void _toggleTaskStatus(String member, int index) {
    setState(() {
      _tasks[member]![index] = !_tasks[member]![index];
    });
  }

  void _saveTasks() {
    Navigator.pushNamed(context, '/report', arguments: _tasks);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task'),
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
            SizedBox(height: 20),
            Text(
              'Task',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.members.length,
                itemBuilder: (context, index) {
                  String member = widget.members[index];
                  return ExpansionTile(
                    title: Text(member),
                    children: [
                      Column(
                        children: List.generate(
                          _tasks[member]!.length,
                          (taskIndex) {
                            return ListTile(
                              title: Text('Juz ${taskIndex + 1}'),
                              trailing: Checkbox(
                                value: _tasks[member]![taskIndex],
                                onChanged: (_) {
                                  _toggleTaskStatus(member, taskIndex);
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveTasks,
        child: Icon(Icons.save),
        backgroundColor: Colors.green,
      ),
    );
  }
}
