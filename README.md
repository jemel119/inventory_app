# ICA #12 — Inventory Management App

A Flutter app that uses Firebase Firestore to manage inventory items in real time.

## Features
- Create, read, update, and delete inventory items
- Real-time updates using Firestore streams and StreamBuilder
- Form validation for all fields (name, quantity, price)
- Loading, empty, and error states handled in the UI

## Enhanced Features

### 1. Category Tags
Each item can be assigned a category (Electronics, Clothing, Food, Tools, Office, or Uncategorized).
Categories display as chips in the list view and are selectable in the add/edit form.
This makes it easy to visually organize and group items at a glance.

### 2. Sort by Name / Price / Quantity
A sort menu in the top-right of the home screen lets users re-order the list
by item name (A–Z), price (low to high), or quantity (low to high).
Sorting applies on top of any active search filter, so both features work together.

## Architecture
- `lib/models/item.dart` — Item data class with toMap/fromMap
- `lib/services/firestore_service.dart` — All Firestore logic (add, stream, update, delete)
- `lib/screens/home_screen.dart` — Main list UI using StreamBuilder
- `lib/screens/item_form_screen.dart` — Add/Edit form with validation

## Setup
1. Clone this repo
2. Run `flutter pub get`
3. Run `flutterfire configure` with your own Firebase project
4. Run `flutter run`