Repository Name: flutter_news_app

Description:

This repository contains the source code for a modern, feature-rich news app built using the Flutter framework. The app is designed to provide users with a seamless and engaging news reading experience, backed by robust architectural principles and state-of-the-art technologies.

Key Features:

API Integration: The app seamlessly integrates with various news APIs, allowing users to access a wide range of news articles, categories, and sources. It provides real-time updates and ensures that users stay informed with the latest news from around the world.

BLoC State Management: To efficiently manage the application's state, we've implemented the Business Logic Component (BLoC) pattern. This ensures a clear separation of concerns, making the app more maintainable, testable, and scalable. The BLoC pattern helps in handling complex UI interactions and data flow in a clean and organized manner.

Clean Architecture: The app follows a clean architecture, separating the code into different layers, including data, domain, and presentation layers. This approach makes the codebase highly modular and easy to understand, with minimal dependencies between layers.

User-Friendly UI: The app features a user-friendly and intuitive user interface, making it easy for users to browse and read news articles. It supports features like search, category filtering, bookmarks, and more.

Customization and Personalization: Users can customize their news feed preferences, select their favorite categories, and save articles to their bookmarks for later reading.

Offline Access: To provide a reliable experience, the app includes caching mechanisms, allowing users to access their saved articles even when they are offline.

Tech Stack:

Flutter: A powerful, cross-platform framework for building natively compiled applications.
Dart: The programming language for Flutter development.
BLoC Pattern: For state management and application logic.
Clean Architecture: To maintain code quality and organization.
HTTP and API Integration: To fetch news data from external sources.
Responsive Design: Ensuring a consistent and appealing layout on various devices.
Contributions and Collaboration:

We welcome contributions and collaboration from the open-source community to enhance the app's features and maintain its code quality. Feel free to fork the repository, create issues, or submit pull requests.

## Installation
### 1. Clone the repo
```bash
git clone https://github.com/XcyzerZero/flutter_news_app.git
cd flutter_news_app
```
### 2. Run pub get
```bash
flutter pub get
```
### 3. Add your API key into api_constants file
```bash
apiKey = 'YOUR_API_KEY';
```
### 4. Run the app
```bash 
flutter run
```
