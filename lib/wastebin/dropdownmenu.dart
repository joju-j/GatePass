
  // List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
  //   List<DropdownMenuItem<String>> _menuItems = [];
  //   for (var item in items) {
  //     _menuItems.addAll(
  //       [
  //         DropdownMenuItem<String>(
  //           value: item,
  //           child: Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //             child: Text(
  //               item,
  //               style: const TextStyle(
  //                 fontSize: 14,
  //               ),
  //             ),
  //           ),
  //         ),
  //         //If it's last item, we will not add Divider after it.
  //         if (item != items.last)
  //           const DropdownMenuItem<String>(
  //             enabled: false,
  //             child: Divider(),
  //           ),
  //       ],
  //     );
  //   }
  //   return _menuItems;
  // }

  // List<int> _getDividersIndexes() {
  //   List<int> _dividersIndexes = [];
  //   for (var i = 0; i < (items.length * 2) - 1; i++) {
  //     //Dividers indexes will be the odd indexes
  //     if (i.isOdd) {
  //       _dividersIndexes.add(i);
  //     }
  //   }
  //   return _dividersIndexes;
  // }
