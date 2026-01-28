# e_commerce_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

TextField(
  maxLines: 1, // single line only
  cursorColor: Colors.green,
  style: const TextStyle(
    color: Colors.green, // text color (optional)
    fontSize: 16,
  ),
  decoration: InputDecoration(
    hintText: "Enter text",
    hintStyle: const TextStyle(color: Colors.green),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors.green,
        width: 3, // increase line width here
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors.green,
        width: 3, // increase line width here too
      ),
    ),
  ),
)