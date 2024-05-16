class Question {
  final String word;
  final String transcription;
  final List<Option> options;
  Option? selectedOption;

  Question ( {
    required this.word,
    required this.transcription,
    required this.options,
    this.selectedOption,
  });
}
class Option {
  final String word;
  final bool isCorrect;

  const Option({
    required this.word,
    required this.isCorrect,
  });
}

final questions = [
  Question(
    word: 'gardener', 
    transcription: '[ˈɡɑːdnə]',
    options: [
      const Option(word: 'Муха', isCorrect: false),
      const Option(word: 'Садовник', isCorrect: true),
      const Option(word: 'Гладиолус', isCorrect: false),
      const Option(word: 'Собака', isCorrect: false),
    ],
  ),
  Question(
    word: 'explain', 
    transcription: '[ɪkˈspleɪn]',
    options: [
      const Option(word: 'Объяснять', isCorrect: true),
      const Option(word: 'Делать', isCorrect: false),
      const Option(word: 'Спать', isCorrect: false),
      const Option(word: 'Подключаться', isCorrect: false),
    ],
  ),
  Question(
    word: 'cockpit', 
    transcription: '[ˈkɒkpɪt]',
    options: [
      const Option(word: 'Командир', isCorrect: false),
      const Option(word: 'Кабина', isCorrect: true),
      const Option(word: 'Артиллерист', isCorrect: false),
      const Option(word: 'Кавалерист', isCorrect: false),
    ],
  ),
  Question(
    word: 'registration', 
    transcription: '[ˌrɛʤɪˈstreɪʃᵊn]',
    options: [
      const Option(word: 'Сетка', isCorrect: false),
      const Option(word: 'Улитка', isCorrect: false),
      const Option(word: 'Сообщество', isCorrect: false),
      const Option(word: 'Регистрация', isCorrect: true),
    ],
  ),
];