import 'package:siraba_chariaw/quiz/model/question_model.dart';

List<QuestionModel> getQuestions() {
  List<QuestionModel> questions = [];
  QuestionModel questionModel = new QuestionModel();

  //1
  questionModel.setQuestion("Ce panneau indique le passage pieton");
  questionModel.setAnswer("True");
  questionModel.setImageUrl("assets/images/pieton.jpg");
  questionModel.setAudioUrl("Danger_pieton.wav"); //Lien de l'audio
  questions.add(questionModel);
  questionModel = new QuestionModel();

  //2
  questionModel
      .setQuestion("Ce Panneau indique un endroit fréquenté par les enfants");
  questionModel.setAnswer("True");
  questionModel.setImageUrl("assets/images/eleve.jpg");
  questionModel.setAudioUrl("Danger_eleve.wav");
  questions.add(questionModel);

  questionModel = new QuestionModel();

  //3
  questionModel.setQuestion("Ce panneau indique de tourner à droite");
  questionModel.setAnswer("False");
  questionModel.setImageUrl("assets/images/false_tourn_droite.png");
  questionModel.setAudioUrl("false_tourn_droite.wav");
  questions.add(questionModel);

  questionModel = new QuestionModel();

  //4
  questionModel.setQuestion("Ce Panneau indique une chaussée rétrécie");
  questionModel.setAnswer("True");
  questionModel.setImageUrl("assets/images/retrecie.png");
  questionModel.setAudioUrl("audio_retrecie.wav");
  questions.add(questionModel);

  questionModel = new QuestionModel();

  //5
  questionModel
      .setQuestion("Ce panneau indique une obligation de tourne à gauche");
  questionModel.setAnswer("True");
  questionModel.setImageUrl("assets/images/obl_tourn_gauche.jpg");
  questionModel.setAudioUrl("ob_tourn_gauche.wav");
  questions.add(questionModel);

  questionModel = new QuestionModel();

  //6
  questionModel.setQuestion("Ce panneau indique une stationnement interdit");
  questionModel.setAnswer("False");
  questionModel.setImageUrl("assets/images/false_station.png");
  questionModel.setAudioUrl("false_interd_station.wav");
  questions.add(questionModel);

  questionModel = new QuestionModel();

  //7
  questionModel.setQuestion("Ce panneau indique une sens interdit");
  questionModel.setAnswer("False");
  questionModel.setImageUrl("assets/images/false_inter_station.png");
  questionModel.setAudioUrl("false_sens_interd.wav");
  questions.add(questionModel);

  questionModel = new QuestionModel();

  //8
  questionModel
      .setQuestion("Ce panneau indique une interdiction de tourner à droite");
  questionModel.setAnswer("True");
  questionModel.setImageUrl("assets/images/droite.png");
  questionModel.setAudioUrl("inter_tourne_droite.wav");
  questions.add(questionModel);

  questionModel = new QuestionModel();

  return questions;
}
