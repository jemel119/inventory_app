# ICA #12 Reflection

## 1. Objective + Expectation
The objective was to build a Flutter app that reads and writes data to Firestore in real time. I expected StreamBuilder to automatically update the list whenever an item was added, edited, or deleted — without me having to manually refresh anything.

## 2. What I Obtained
The app fully met this expectation. When I added a new item, it appeared in the list instantly. When I deleted one, it disappeared immediately. The StreamBuilder rebuilt the widget tree every time Firestore sent a new snapshot, which confirmed real-time synchronization was working correctly.

## 3. Evidence
- Adding an item in the form navigated back to the home screen, where the item
  appeared at the top of the list without any manual reload.
- Deleting an item via the confirm dialog removed it from the list in under one second.
- Editing an item and saving showed the updated values immediately on the card.
- Form validation blocked empty submissions and non-numeric entries for quantity/price.

## 4. Analysis
The real-time behavior works because streamItems() returns a Firestore snapshots() stream. Each Firestore write triggers a new snapshot event, which StreamBuilder listens to and uses to rebuild the ListView. The service layer (FirestoreService) keeps all Firestore logic separate from the UI, making the widgets focused only on display. The TextEditingControllers are disposed in the dispose() method to prevent memory leaks.

## 5. Improvement Plan
If this app scaled to thousands of items, fetching the entire collection in one stream would become slow. I would add server-side Firestore queries (e.g., .where() and .orderBy()) so that sorting and filtering happen on the database instead of in the Flutter client. This would reduce data transfer and improve performance.

---

## Critical Thinking Prompts

**Which objective was easiest?**
Implementing CRUD was the most straightforward. The Firestore API is clean and the add/update/delete methods map directly to service functions with minimal boilerplate.

**Which objective was hardest?**
Handling all three UI states (loading, empty, error) in StreamBuilder required care I initially forgot the error check and only added it after noticing that a misconfigured Firestore rule silently broke the stream.

**Where did expected behavior not match?**
I expected StreamBuilder to show a loading spinner only on first load, but it also shows briefly on app cold start while Firebase initializes. I resolved this by ensuring Firebase.initializeApp() completes before runApp() is called.

**How does commit history show growth?**
The commits progress from scaffold → model → service → UI → form → polish, which mirrors the Recommended phases and shows incremental, working builds.

**If this scaled to many users?**
I would move sorting and filtering to Firestore queries with composite indexes, add pagination using Firestore's startAfter cursor, and introduce user authentication so each user sees only their own inventory.