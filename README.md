💊 Medicine Reminder App (Flutter)

A simple and clean Medicine Reminder application built using Flutter, designed to help users schedule their daily medicines and receive reminders at the correct time.

This project was developed as part of a technical assignment to demonstrate coding standards, UI discipline, state management, and time-based logic.

📱 Features

🏠 Home Screen

Displays a list of medicines with:

Medicine Name

Dose

Scheduled Time

Medicines are sorted by time (earlier medicines shown first)

Shows a placeholder message when no medicines are added

➕ Add Medicine Screen

Form to add:

Medicine name

Dose

Time (using Time Picker)

Validation to prevent saving empty forms

⏰ Reminder Logic (Demo)

In-app popup reminder appears when the scheduled time matches

Clearly shows:

Medicine name

Dose

Designed for demonstration purposes on desktop/web environments

💾 Local Storage

Medicines are stored locally using Hive

Data persists across app restarts

No backend required

🎨 UI Design Constraints

Primary color: Teal

Buttons & accents: Orange

Clean and minimal UI focused on usability

🧠 Architecture & Technical Decisions

State Management:

Implemented using Provider

Avoids excessive use of setState

Clear separation between UI and business logic

Project Structure:

lib/
 ├── models/
 ├── providers/
 ├── screens/
 ├── services/
 └── theme/


Why in-app popup for reminder demo?

Browser environments (Flutter Web / Chrome) restrict background execution and OS-level notifications.

For demonstration, an in-app time-based popup was implemented to clearly show scheduling logic.

The same logic can be extended to platform-specific notifications (Android/iOS).

🛠️ Tech Stack

Framework: Flutter

Language: Dart

State Management: Provider

Local Storage: Hive

UI: Material Design

Platforms Tested: Windows Desktop, Chrome (Web)

▶️ How to Run the Project

Clone the repository:

git clone https://github.com/your-username/medicine-reminder-app.git


Navigate to the project directory:

cd medicine-reminder-app


Install dependencies:

flutter pub get


Run the app:

flutter run
