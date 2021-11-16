class QuestionModel {
  String question = "";
  String answer = "";
  String imageUrl = "";
  String audioUrl = "";

  QuestionModel({question, answer});

  void setQuestion(String getQuestion) {
    question = getQuestion;
  }

  void setAnswer(String getAnswer) {
    answer = getAnswer;
  }

  void setImageUrl(String getImageUrl) {
    imageUrl = getImageUrl;
  }

  void setAudioUrl(String getAudioUrl) {
    audioUrl = getAudioUrl;
  }

  String getQuestion() {
    return question;
  }

  String getAnswer() {
    return answer;
  }

  String getImageUrl() {
    return imageUrl;
  }

  String getAudioUrl() {
    return audioUrl;
  }
}
