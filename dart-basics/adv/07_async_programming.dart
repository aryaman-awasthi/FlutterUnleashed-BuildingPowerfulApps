void main() async {
  DataService dataService = DataService();
  String data = await dataService.getData();
  print(data);
}

class DataService {
  Future<String> _getDataFromCloud() async {
    await Future.delayed(Duration(
        seconds: 4)); // replicating something like delay due to api call
    print("get data finished");
    return "fake data";
  }

  Future<String> _parsedDataFromCloud({required String dataFromCloud}) async {
    await Future.delayed(Duration(
        seconds: 2)); // replicating something like delay due to api call
    print("parsed data finished");
    return "parsed data";
  }

  Future<String> getData() async {
    // get data -> time
    // parse data -> time
    // return data;

    // final String dataFromCloud = await _getDataFromCloud();
    // final String parsedData =
    //     await _parsedDataFromCloud(dataFromCloud: dataFromCloud);

    //! Alternative way syntax

    final String parsedData =
        await _getDataFromCloud().then((dataFromCloud) async {
      return await _parsedDataFromCloud(dataFromCloud: dataFromCloud);
    });

    return parsedData;
    // Future means that this function will be executed in the future.
    // to make this function Future type we need to write async just to tell that this function contains async code.
  }
}
