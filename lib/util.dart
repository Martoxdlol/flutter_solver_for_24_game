// List<List<T>> repeatPermutations<T>(T item, int repetitions) {
//   List<List<T>> result = [];

//   void backtrack(List<T> currentPermutation) {
//     if (currentPermutation.length == repetitions) {
//       result.add(List.from(currentPermutation));
//       return;
//     }

//     for (int i = 0; i < currentPermutation.length + 1; i++) {
//       List<T> newPermutation = List.from(currentPermutation);
//       newPermutation.insert(i, item);
//       backtrack(newPermutation);
//     }
//   }

//   backtrack([]);
//   return result;
// }

// List<List<T>> permutations<T>(List<T> items) {
//   List<List<T>> result = [];

//   void backtrack(int start) {
//     if (start == items.length - 1) {
//       result.add(List.from(items));
//       return;
//     }

//     for (int i = start; i < items.length; i++) {
//       // Swap items[start] with items[i]
//       T temp = items[start];
//       items[start] = items[i];
//       items[i] = temp;

//       backtrack(start + 1);

//       // Restore the original order
//       temp = items[start];
//       items[start] = items[i];
//       items[i] = temp;
//     }
//   }

//   backtrack(0);
//   return result;
// }

// List<List<T>> combinations<T>(List<T> items, int k) {
//   List<List<T>> result = [];

//   void backtrack(List<T> currentCombination, int start) {
//     if (currentCombination.length == k) {
//       result.add(List.from(currentCombination));
//       return;
//     }

//     for (int i = start; i < items.length; i++) {
//       currentCombination.add(items[i]);
//       backtrack(currentCombination, i + 1);
//       currentCombination.removeLast();
//     }
//   }

//   backtrack([], 0);
//   return result;
// }
