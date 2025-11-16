import 'package:flutter/material.dart';
import '../models/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = []; // Holds tasks in memory

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Tasks"),
      ),

      body: Container(
        // Gradient background
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F2FD), Color(0xFF90CAF9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: tasks.isEmpty
            ? const Center(
          child: Text(
            "No tasks here.",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        )
            : ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];

            return Card(
              // Rounded task card UI
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 4,
              margin: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 8,
              ),

              child: ListTile(
                title: Text(
                  task.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    "Deadline: ${task.deadline}\n${task.description}",
                  ),
                ),
              ),
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        // Navigate to New Task screen
        onPressed: () async {
          var result = await Navigator.pushNamed(context, '/new');

          // Add task if returned
          if (result != null && result is Task) {
            setState(() {
              tasks.add(result);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
