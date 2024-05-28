class CommonController {
  void checkUpdatingValue(data, updateData, fields) {
    var oldData = data;

    if (oldData != null) {
     
      Map<String, dynamic> updatedData = {};
 
      fields.forEach((key, value) {
        if (oldData[key] != null && oldData[key] != value && value != "") {
          updatedData[key] = value;
          print(updatedData);
        }
      });

      if (updatedData.isNotEmpty) {
        print("Updated Data: $updatedData");
        updateData(updatedData);
      } else {
        print("No changes detected.");
      }
    }
  } 
}

