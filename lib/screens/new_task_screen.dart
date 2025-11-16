import 'package:flutter/material.dart';
import '../models/task.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final _formKey = GlobalKey<FormState>(); // For validation

  final titleController = TextEditingController();
  final deadlineController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Task"),
        leading: IconButton(
          // Back arrow
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Form(
          key: _formKey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: titleController,
                // Rounded input box
                decoration: InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                // Validate input
                validator: (value) =>
                (value == null || value.isEmpty) ? "Required" : null,
              ),

              const SizedBox(height: 12),

              TextFormField(
                controller: deadlineController,
                decoration: InputDecoration(
                  labelText: "Deadline",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) =>
                (value == null || value.isEmpty) ? "Required" : null,
              ),

              const SizedBox(height: 12),

              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) =>
                (value == null || value.isEmpty) ? "Required" : null,
              ),

              const SizedBox(height: 24),

              Center(
                child: ElevatedButton(
                  // Rounded save button
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 14,
                    ),
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                  ),

                  onPressed: () {
                    // Check all fields
                    if (!_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("All fields are required."),
                        ),
                      );
                      return;
                    }

                    // Create task
                    final task = Task(
                      title: titleController.text,
                      deadline: deadlineController.text,
                      description: descriptionController.text,
                    );

                    Navigator.pop(context, task); // Return task
                  },

                  child: const Text(
                    "Save Task",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
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
