const odiQuestions = [
  {
    'fieldId': 1,
    'fieldName': 'question1',
    'fieldPointName': 'question1_point',
    'fieldLabel': 'Pain Intensity',
    'fieldScores': [
      {
        'scoreName': 'I have no pain at the moment',
        'scoreValue': 0,
      },
      {
        'scoreName': 'The pain is very mild at the moment',
        'scoreValue': 1,
      },
      {
        'scoreName': 'The pain is moderate at the moment',
        'scoreValue': 2,
      },
      {
        'scoreName': 'The pain is fairly severe at the moment',
        'scoreValue': 3,
      },
      {
        'scoreName': 'The pain is very severe at the moment',
        'scoreValue': 4,
      },
      {
        'scoreName': 'The pain is the worst imaginable at the moment',
        'scoreValue': 5,
      },
    ]
  },
  {
    'fieldId': 2,
    'fieldName': 'question2',
    'fieldPointName': 'question2_point',
    'fieldLabel': 'Personal Care (Washing, Dressing etc)',
    'fieldScores': [
      {
        'scoreName': 'I can look after myself normally without causing extra pain',
        'scoreValue': 0,
      },
      {
        'scoreName': 'I can look after myself normally but it causes extra pain',
        'scoreValue': 1,
      },
      {
        'scoreName': 'It is painful to look after myself and I am slow and careful',
        'scoreValue': 2,
      },
      {
        'scoreName': 'I need some help but manage most of my personal care',
        'scoreValue': 3,
      },
      {
        'scoreName': 'I need help every day in most aspects of self-care',
        'scoreValue': 4,
      },
      {
        'scoreName': 'I do not get dressed, I wash with difficulty and stay in bed',
        'scoreValue': 5,
      },
    ]
  },
  {
    'fieldId': 3,
    'fieldName': 'question3',
    'fieldPointName': 'question3_point',
    'fieldLabel': 'Lifting',
    'fieldScores': [
      {
        'scoreName': 'I can lift heavy weights without extra pain',
        'scoreValue': 0,
      },
      {
        'scoreName': 'I can lift heavy weights but it gives extra pain',
        'scoreValue': 1,
      },
      {
        'scoreName': 'Pain prevents me from lifting heavy weights off the floor, but I can manage if they are conveniently placed eg. on a table',
        'scoreValue': 2,
      },
      {
        'scoreName': 'Pain prevents me from lifting heavy weights, but I can manage light to medium weights if they are conveniently positioned',
        'scoreValue': 3,
      },
      {
        'scoreName': 'I can lift very light weights',
        'scoreValue': 4,
      },
      {
        'scoreName': 'I cannot lift or carry anything at all',
        'scoreValue': 5,
      },
    ]
  },
  {
    'fieldId': 4,
    'fieldName': 'question4',
    'fieldPointName': 'question4_point',
    'fieldLabel': 'Walking',
    'fieldScores': [
      {
        'scoreName': 'Pain does not prevent me walking any distance',
        'scoreValue': 0,
      },
      {
        'scoreName': 'Pain prevents me from walking more than 2 kilometres',
        'scoreValue': 1,
      },
      {
        'scoreName': 'Pain prevents me from walking more than 1 kilometre',
        'scoreValue': 2,
      },
      {
        'scoreName': 'Pain prevents me from walking more than 500 metres',
        'scoreValue': 3,
      },
      {
        'scoreName': 'I can only walk using a stick or crutches',
        'scoreValue': 4,
      },
      {
        'scoreName': 'I am in bed most of the time',
        'scoreValue': 5,
      },
    ]
  },
  {
    'fieldId': 5,
    'fieldName': 'question5',
    'fieldPointName': 'question5_point',
    'fieldLabel': 'Sitting',
    'fieldScores': [
      {
        'scoreName': 'I can sit in any chair as long as I like',
        'scoreValue': 0,
      },
      {
        'scoreName': 'I can only sit in my favourite chair as long as I like',
        'scoreValue': 1,
      },
      {
        'scoreName': 'Pain prevents me sitting more than one hour',
        'scoreValue': 2,
      },
      {
        'scoreName': 'Pain prevents me from sitting more than 30 minutes',
        'scoreValue': 3,
      },
      {
        'scoreName': 'Pain prevents me from sitting more than 10 minutes',
        'scoreValue': 4,
      },
      {
        'scoreName': 'Pain prevents me from sitting at all',
        'scoreValue': 5,
      },
    ]
  },
  {
    'fieldId': 6,
    'fieldName': 'question6',
    'fieldPointName': 'question6_point',
    'fieldLabel': 'Standing',
    'fieldScores': [
      {
        'scoreName': 'I can stand as long as I want without extra pain',
        'scoreValue': 0,
      },
      {
        'scoreName': 'I can stand as long as I want but it gives me extra pain',
        'scoreValue': 1,
      },
      {
        'scoreName': 'Pain prevents me from standing for more than 1 hour',
        'scoreValue': 2,
      },
      {
        'scoreName': 'Pain prevents me from standing for more than 3 minutes',
        'scoreValue': 3,
      },
      {
        'scoreName': 'Pain prevents me from standing for more than 10 minutes',
        'scoreValue': 4,
      },
      {
        'scoreName': 'Pain prevents me from standing at all',
        'scoreValue': 5,
      },
    ]
  },
  {
    'fieldId': 7,
    'fieldName': 'question7',
    'fieldPointName': 'question7_point',
    'fieldLabel': 'Sleeping',
    'fieldScores': [
      {
        'scoreName': 'My sleep is never disturbed by pain',
        'scoreValue': 0,
      },
      {
        'scoreName': 'My sleep is occasionally disturbed by pain',
        'scoreValue': 1,
      },
      {
        'scoreName': 'Because of pain I have less than 6 hours sleep',
        'scoreValue': 2,
      },
      {
        'scoreName': 'Because of pain I have less than 4 hours sleep',
        'scoreValue': 3,
      },
      {
        'scoreName': 'Because of pain I have less than 2 hours sleep',
        'scoreValue': 4,
      },
      {
        'scoreName': 'Pain prevents me from sleeping at all',
        'scoreValue': 5,
      },
    ]
  },
  {
    'fieldId': 8,
    'fieldName': 'question8',
    'fieldPointName': 'question8_point',
    'fieldLabel': 'Sex Life (if applicable)',
    'fieldScores': [
      {
        'scoreName': 'My sex life is normal and causes no extra pain',
        'scoreValue': 0,
      },
      {
        'scoreName': 'My sex life is normal but causes some extra pain',
        'scoreValue': 1,
      },
      {
        'scoreName': 'My sex life is nearly normal but is very painful',
        'scoreValue': 2,
      },
      {
        'scoreName': 'My sex life is severely restricted by pain',
        'scoreValue': 3,
      },
      {
        'scoreName': 'My sex life is nearly absent because of pain',
        'scoreValue': 4,
      },
      {
        'scoreName': 'Pain prevents any sex life at all',
        'scoreValue': 5,
      },
    ]
  },
  {
    'fieldId': 9,
    'fieldName': 'question9',
    'fieldPointName': 'question9_point',
    'fieldLabel': 'Social Life',
    'fieldScores': [
      {
        'scoreName': 'My social life is normal and gives me no extra pain',
        'scoreValue': 0,
      },
      {
        'scoreName': 'My social life is normal but increases the degree of pain',
        'scoreValue': 1,
      },
      {
        'scoreName': 'Pain has no significant effect on my social life apart from limiting my more energetic interests eg, sport',
        'scoreValue': 2,
      },
      {
        'scoreName': 'Pain has restricted my social life and I do not go out as often',
        'scoreValue': 3,
      },
      {
        'scoreName': 'Pain has restricted my social life to my home',
        'scoreValue': 4,
      },
      {
        'scoreName': 'I have no social life because of pain',
        'scoreValue': 5,
      },
    ]
  },
  {
    'fieldId': 10,
    'fieldName': 'question10',
    'fieldPointName': 'question10_point',
    'fieldLabel': 'Travelling',
    'fieldScores': [
      {
        'scoreName': 'I can travel anywhere without pain',
        'scoreValue': 0,
      },
      {
        'scoreName': 'I can travel anywhere but it gives me extra pain',
        'scoreValue': 1,
      },
      {
        'scoreName': 'Pain is bad but I manage journeys over two hours',
        'scoreValue': 2,
      },
      {
        'scoreName': 'Pain restricts me to journeys of less than one hour',
        'scoreValue': 3,
      },
      {
        'scoreName': 'Pain restricts me to short necessary journeys under 30 minutes',
        'scoreValue': 4,
      },
      {
        'scoreName': 'Pain prevents me from travelling except to receive treatment',
        'scoreValue': 5,
      },
    ]
  },
];
