# Flutter To-Do App

This project is a simple two-screen to-do application built with Flutter.

## Features
- Home Screen shows an empty message or a list of tasks
- Floating Action Button opens the New Task screen
- New Task screen includes Title, Deadline, and Description fields
- Save button validates input and returns the task to the Home Screen
- Back arrow returns without saving
- Custom styling (gradient background, rounded cards, rounded fields, Google Font)

## How It Works
Tasks are stored in a list on the Home Screen.  
When a user saves a task, the New Task screen sends it back using `Navigator.pop()`, and the Home Screen updates the list with `setState()`.