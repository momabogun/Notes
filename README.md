# Notes App

## Description
This is a simple notes app developed in Swift that follows the MVVM (Model-View-ViewModel) architecture. It utilizes CoreData for data persistence and SwiftUI for the user interface.

The app allows users to create, read, update, and delete notes. Each note can be assigned a priority level of low, medium, or high.

## Features
- **MVVM Architecture**: Organized separation of concerns with Models, Views, and ViewModels.
- **CoreData**: Persistent storage used for managing notes data.
- **CRUD Operations**: Full support for Create, Read, Update, and Delete operations on notes.
- **Note Priorities**: Ability to set priority levels (low, medium, high) for each note.
- **SwiftUI**: Utilizes SwiftUI for building the user interface.

## Requirements
- iOS 14.0+
- Xcode 12.0+
- Swift 5.0+

## Installation
To run the app:
1. Clone the repository.
2. Open the project in Xcode.
3. Build and run the app on a simulator or a connected iOS device.

## Usage
Upon launching the app, users can:
- View existing notes.
- Add new notes with title, content, and priority level selection.
- Update or delete existing notes.
- Filter notes by priority level.

## Structure
The project is structured as follows:
- `Models`: Contains the data models for notes.
- `Views`: SwiftUI views for displaying and interacting with notes.
- `ViewModels`: Contains the view models responsible for managing data flow.
- `CoreData`: Manages the CoreData stack and entities for note storage.
- `Utils`: Utility functions and helpers.

## Contributing
Contributions are welcome! If you'd like to contribute to the project, feel free to open a pull request.
