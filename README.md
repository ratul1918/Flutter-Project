# University CGPA Calculator

A powerful and user-friendly Flutter application designed to help university students calculate their Cumulative Grade Point Average (CGPA) effortlessly. This app intelligently handles regular courses, retakes, and provides real-time CGPA updates.

## About

The University CGPA Calculator is a mobile application built with Flutter that simplifies the process of tracking academic performance. Students can add courses, input grades and credits, and instantly see their updated CGPA. The app supports both regular course entries and course retakes, making it perfect for students pursuing grades improvement.

---

## Features

### Core Functionality

- Add Regular & Retake Courses - Easily manage course entries with support for retakes
- Real-time CGPA Calculation - Instantly calculate updated CGPA as you add courses
- Grade Point Management - Input course credit hours and corresponding grade points
- Course History - View and manage all your course entries
- Quick Reset - Clear all data and start fresh
- Responsive UI - Beautiful and intuitive Material Design interface
- Lightweight & Fast - Minimal dependencies for optimal performance

### Academic Features

- Support for Multiple Grading Systems - Compatible with various university grading scales
- Retake Course Handling - Properly manages course retakes with grade replacement logic
- GPA Tracking - Track both individual semester and cumulative GPA
- Credit Hour Management - Manage variable credit hours for different courses
- Instant Updates - Real-time calculation as you add or modify courses

### User Experience

- Intuitive Material Design Interface
- Easy course input with validation
- Clear visual feedback for calculations
- Quick access to course management
- Data persistence and storage
- Simple and clean UI without clutter

---

## Technologies Used

### Framework & Language
- Flutter - Cross-platform mobile development framework
- Dart - Programming language for Flutter
- Material Design - UI/UX design framework and guidelines

### Architecture & Design
- Stateful Widgets - Dynamic UI components for real-time updates
- Custom Logic - Advanced CGPA calculation algorithms
- Provider/State Management - Efficient state handling (if applicable)
- Local Storage - Persistent data management

### Build Tools
- Android: Gradle (Kotlin DSL) with support for API 21+
- iOS: Xcode with support for iOS 11.0+
- Flutter SDK: Version 3.7.0 or higher
- Dart SDK: Bundled with Flutter

### Development Environment
- Android Studio or Visual Studio Code
- Xcode for iOS development
- Git for version control

---

## Project Structure

\`\`\`
University-CGPA-Calculator/
├── lib/
│   ├── main.dart                         # Main application entry point
│   ├── models/                          # Data models (if applicable)
│   ├── screens/                         # UI screens and pages
│   ├── widgets/                         # Reusable UI components
│   ├── services/                        # Business logic and utilities
│   └── utils/                           # Helper functions and constants
├── android/
│   ├── app/
│   │   ├── build.gradle.kts            # App-level build configuration
│   │   └── src/
│   │       ├── main/                   # Main Android source files
│   │       ├── debug/                  # Debug-specific configurations
│   │       └── profile/                # Profile-specific configurations
│   ├── build.gradle.kts                # Project-level build configuration
│   ├── gradle.properties               # Gradle properties
│   └── settings.gradle.kts             # Gradle settings
├── ios/
│   ├── Runner/
│   │   ├── AppDelegate.swift           # iOS app delegate
│   │   ├── GeneratedPluginRegistrant   # Auto-generated plugin registry
│   │   ├── Assets.xcassets/            # App icons and images
│   │   └── Info.plist                  # iOS configuration
│   ├── Runner.xcodeproj/               # Xcode project configuration
│   └── Runner.xcworkspace/             # Xcode workspace
├── test/
│   └── widget_test.dart                # Unit and widget tests
├── pubspec.yaml                        # Project dependencies and metadata
├── analysis_options.yaml               # Dart analysis configuration
└── README.md                           # Project documentation
\`\`\`

---

## Getting Started

### Prerequisites

- Flutter SDK Version 3.7.0 or higher
- Dart SDK (bundled with Flutter)
- Android Studio (for Android development)
- Xcode (for iOS development on macOS)
- Git for version control

### Installation Steps

1. Clone the repository
   \`\`\`bash
   git clone https://github.com/ratul1918/Flutter-Project.git
   cd University-CGPA-Calculator
   \`\`\`

2. Install dependencies
   \`\`\`bash
   flutter pub get
   \`\`\`

3. Run the application
   \`\`\`bash
   flutter run
   \`\`\`

4. Build for specific platform
   \`\`\`bash
   # For Android
   flutter run --debug
   
   # For iOS (macOS only)
   flutter run -d ios
   \`\`\`

### Build for Release

Build Android Release APK:
\`\`\`bash
flutter build apk --release
\`\`\`

Build Android App Bundle:
\`\`\`bash
flutter build appbundle --release
\`\`\`

Build iOS Release App:
\`\`\`bash
flutter build ios --release
\`\`\`

---

## Project Functionality

### Main Features Explained

#### 1. Course Addition
- Users can add multiple courses to the calculator
- Each course requires course name, credit hours, and grade point
- Supports both regular and retake course types
- Input validation ensures data accuracy

#### 2. CGPA Calculation Engine
- Calculates CGPA using the standard formula
- Properly handles retake courses by replacing previous grades
- Updates calculations in real-time
- Accounts for variable credit hours
- Maintains accuracy with floating-point arithmetic

#### 3. Data Management
- Displays all added courses in a list format
- Shows individual course grades and credits
- Provides cumulative CGPA calculation
- Allows editing and deletion of courses
- Maintains course history for reference

#### 4. User Interface
- Clean and intuitive Material Design interface
- Responsive layout for various screen sizes
- Easy navigation between screens
- Clear visual representation of data
- Input fields with proper validation and error messages

#### 5. Calculation Logic
\`\`\`
CGPA = (Sum of (Grade Point x Credit Hours)) / (Sum of Credit Hours)

For Retakes:
- New grade replaces the old grade
- Original credit hours are typically used
- Only new grade contributes to CGPA calculation
\`\`\`

---

## Platform Support

### Android
- Minimum SDK: Android 5.0 (API 21)
- Target SDK: Latest Android version
- Supported devices: Phones and tablets
- ARM and x86 architecture support

### iOS
- Minimum Version: iOS 11.0
- Supported devices: iPhone and iPad
- Swift/Objective-C compatibility
- A9 processor and newer

### Future Platforms
- Web version support (coming soon)
- Tablet optimization
- Foldable device support

---

## How to Use the Application

1. Launch the Application
   - Open the CGPA Calculator from your device

2. Add Your First Course
   - Tap on "Add Course" button
   - Enter course name (e.g., "Mathematics 101")
   - Input credit hours (e.g., 3 or 4)
   - Enter grade point (e.g., 4.0, 3.5, 3.0)

3. Select Course Type
   - Choose "Regular" for a new course
   - Choose "Retake" for re-attempting a course

4. View Your Results
   - See updated CGPA calculation instantly
   - Review all courses in the course list
   - Monitor your academic progress

5. Manage Your Courses
   - Edit course details by tapping on a course
   - Delete courses by swiping or using delete button
   - View complete course history

6. Reset Data
   - Use reset function to clear all courses
   - Starts fresh calculation from zero

---

## CGPA Calculation Formula

The application uses the standard GPA calculation methodology:

CGPA = (Sum of Grade Points) / (Total Credit Hours)

Where:
- Grade Point = Grade (4.0, 3.5, 3.0, etc.) multiplied by Credit Hours
- Total Credit Hours = Sum of all course credit hours
- Retake courses replace previous grades in calculation

Example:
- Course 1: 3 credits, 4.0 grade point = 12.0 grade points
- Course 2: 4 credits, 3.5 grade point = 14.0 grade points
- Total: 26.0 grade points / 7 credits = 3.71 CGPA

---

## Contributing Guidelines

We welcome contributions from developers and students. Here's how to contribute:

1. Fork the repository on GitHub
2. Create a feature branch for your changes
   \`\`\`bash
   git checkout -b feature/your-feature-name
   \`\`\`
3. Make your changes and commit them
   \`\`\`bash
   git commit -m "Add your feature description"
   \`\`\`
4. Push to your fork
   \`\`\`bash
   git push origin feature/your-feature-name
   \`\`\`
5. Create a Pull Request with detailed description
6. Wait for code review and feedback

### Code Style Guidelines
- Follow Dart style guide and best practices
- Write clean, readable, and documented code
- Add comments for complex logic
- Test your changes before submitting

---

## Development Workflow

### Setting Up Development Environment
1. Install Flutter SDK from flutter.dev
2. Clone the repository
3. Run flutter pub get
4. Open project in preferred IDE (VS Code or Android Studio)
5. Create a feature branch for development

### Building and Testing
1. Run flutter analyze to check for issues
2. Run flutter test for unit tests
3. Run flutter run for development testing
4. Build release versions for deployment

### Debugging
- Use Flutter DevTools for debugging
- Enable verbose logging with flutter run -v
- Use breakpoints in IDE for stepping through code
- Check console output for error messages

---

## License

This project is licensed under the MIT License. See LICENSE file for complete details.

Permission is granted to use, modify, and distribute this software freely.

---

## Author Information

Developer: Rafiur Rahman
GitHub: https://github.com/ratul1918
Project Repository: https://github.com/ratul1918/Flutter-Project

---

## Support and Contact

For issues, bug reports, or feature requests:

1. Open an issue on GitHub Issues page
2. Provide detailed description of the problem
3. Include steps to reproduce the issue
4. Attach screenshots or logs if applicable

Support Email: For direct support inquiries
GitHub Issues: https://github.com/ratul1918/Flutter-Project/issues

---

## Future Enhancements and Roadmap

### Planned Features
- GPA vs CGPA comparison chart
- Cloud backup and synchronization
- Dark mode support for the application
- Grade distribution analytics and visualization
- Academic milestone notifications
- Web version of the application
- Export CGPA to PDF or CSV format
- Multi-language support
- Semester-wise GPA tracking
- Course recommendation system

### Long-term Goals
- Mobile app store distribution (Google Play, App Store)
- University integration for official records
- Offline functionality enhancement
- Performance optimization
- User authentication and profiles
- Social sharing features
- Analytics dashboard

---

## Frequently Asked Questions

Q: Can I use this app on both Android and iOS?
A: Yes, the app is built with Flutter and supports both Android 5.0+ and iOS 11.0+.

Q: Will my data be saved if I close the app?
A: Yes, course data is persisted locally on your device.

Q: Can I export my CGPA data?
A: This feature will be added in future versions.

Q: How accurate is the CGPA calculation?
A: The app uses standard university CGPA calculation formulas and is highly accurate.

Q: Is my data secure?
A: All data is stored locally on your device. No data is sent to external servers.

---

## Additional Resources

- Flutter Documentation: https://flutter.dev/docs
- Dart Documentation: https://dart.dev/docs
- Material Design Guidelines: https://material.io/design
- GitHub Repository: https://github.com/ratul1918/Flutter-Project

---

## Version History

Version 1.0.0 (Current)
- Initial release with core functionality
- CGPA calculation engine
- Course management system
- Material Design UI
- Android and iOS support

---

Last Updated: January 2026
For the latest updates, visit the GitHub repository.