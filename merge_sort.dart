void main() {
  var numbers = [8, 6, 2, 7, 4, 1, 9, 3, 0, 5];
  print(mergeSort(numbers));
}

List<int> mergeSort(List<int> array) {
  // Stop recursion if array contains only one element
  if (array.length <= 1) {
    return array;
  }

  // split in the middle of the array
  int splitIndex = array.length ~/ 2;

  // recyrsively call merge sort on left and right array
  List<int> leftArray = mergeSort(array.sublist(0, splitIndex));
  List<int> rightArray = mergeSort(array.sublist(splitIndex));

  return merge(leftArray, rightArray);
}

List<int> merge(List leftArray, List rightArray) {
  List<int> result = [];
  int? i = 0;
  int? j = 0;

  // Search for the smallest element in left and right arrays
  // Array adn insert it into result
  // After the loop only one array has remaining elements
  while (i! < leftArray.length && j! < rightArray.length) {
    if (leftArray[i] < rightArray[j]) {
      result.add(leftArray[i]);
      i++;
    } else {
      result.add(rightArray[j]);
      j++;
    }
  }

  // Insert remaining elements of left array into result
  // as long as there are remaining elements
  while (i! < leftArray.length) {
    result.add(leftArray[i]);
    i++;
  }

  // Insert remaining elements of right array into result
  // as long as there are remaining elements
  while (j! < rightArray.length) {
    result.add(rightArray[j]);
    j++;
  }
  return result;
}
