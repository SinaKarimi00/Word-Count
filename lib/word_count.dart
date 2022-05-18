class WordCount {
  // Put your code here
  Map<String, int> words = {};
  Map countWords(String text) {
    for (var item in RemoveExtraThings(text)) {
      item = MatchQutation(item.toString());
      CheckWords(item.toString());
    }
    return words;
  }

  List RemoveExtraThings(String text) {
    return text
        .replaceAll(new RegExp(','), ' ')
        .replaceAll(new RegExp(r'[^\w\s]+'), '')
        .replaceAll(new RegExp(r"\s+"), " ")
        .trim()
        .toLowerCase()
        .split(' ');
  }

  String MatchQutation(String item) {
    switch (item) {
      case 'cant':
        item = 'can\'t';
        break;
      case 'dont':
        item = 'don\'t';
        break;
      case 'thats':
        item = 'that\'s';
        break;
      case 'theyre':
        item = 'they\'re';
        break;
      case 'youre':
        item = 'you\'re';
        break;
      case 'im':
        item = 'i\'m';
        break;
    }
    return item;
  }

  void CheckWords(String item) {
    if (words.containsKey(item)) {
      words.update(item.toString(), (value) => value + 1);
    } else {
      words[item.toString()] = 1;
    }
  }
}
