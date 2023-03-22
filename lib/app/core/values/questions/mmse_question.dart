const mmseQuestions = [
  {
    'id': 1,
    'questionName': 'Orientation',
    'fields': [
      {
        'fieldId': 1,
        'fieldName': 'question1.1',
        'fieldPointName': 'question1.1_point',
        'fieldLabel': 'What is the',
        'fieldPointValue': 0,
        'fieldScores': [
          {
            'scoreName': 'Year',
            'scoreValue': 1,
          },
          {
            'scoreName': 'Season',
            'scoreValue': 1,
          },
          {
            'scoreName': 'Day of the week',
            'scoreValue': 1,
          },
          {
            'scoreName': 'Month',
            'scoreValue': 1,
          },
          {
            'scoreName': 'Date',
            'scoreValue': 1,
          },
        ]
      },
      {
        'fieldId': 2,
        'fieldName': 'question1.2',
        'fieldPointName': 'question1.2_point',
        'fieldLabel': 'Where are we now?',
        'fieldPointValue': 0,
        'fieldScores': [
          {
            'scoreName': 'State',
            'scoreValue': 1,
          },
          {
            'scoreName': 'County',
            'scoreValue': 1,
          },
          {
            'scoreName': 'Town/city',
            'scoreValue': 1,
          },
          {
            'scoreName': 'Hospital',
            'scoreValue': 1,
          },
          {
            'scoreName': 'Floor',
            'scoreValue': 1,
          },
        ]
      },
    ]
  },
  {
    'id': 2,
    'questionName': 'Registration',
    'fields': [
      {
        'fieldId': 1,
        'fieldName': 'question2.1',
        'fieldPointName': 'question2.1_point',
        'fieldLabel':
            'Say the names of three unrelated objects clearly and slowly. Ask the patient to repeat them. Tell the patient, "Try to remember the words, as I will ask for them in a little while',
        'fieldPointValue': 0,
        'fieldScores': [
          {
            'scoreName': 'Apple',
            'scoreValue': 1,
          },
          {
            'scoreName': 'Table',
            'scoreValue': 1,
          },
          {
            'scoreName': 'Penny',
            'scoreValue': 1,
          },
        ]
      },
    ]
  },
  {
    'id': 3,
    'questionName': 'Attention and Calculation',
    'fields': [
      {
        'fieldId': 1,
        'fieldName': 'question3.1',
        'fieldPointName': 'question3.1_point',
        'fieldLabel':
            'Ask the patient to begin with 100 and count backward by sevens/or spell the word "world" backwards',
        'fieldPointValue': 0,
        'fieldScores': [
          {
            'scoreName': '93/D',
            'scoreValue': 1,
          },
          {
            'scoreName': '86/L',
            'scoreValue': 1,
          },
          {
            'scoreName': '79/R',
            'scoreValue': 1,
          },
          {
            'scoreName': '72/O',
            'scoreValue': 1,
          },
          {
            'scoreName': '65/W',
            'scoreValue': 1,
          },
        ]
      },
    ]
  },
  {
    'id': 4,
    'questionName': 'Recall',
    'fields': [
      {
        'fieldId': 1,
        'fieldName': 'question4.1',
        'fieldPointName': 'question4.1_point',
        'fieldLabel':
            'Earlier I told you the names of three things. Can you tell me what those were?',
        'fieldPointValue': 0,
        'fieldScores': [
          {
            'scoreName': 'Apple',
            'scoreValue': 1,
          },
          {
            'scoreName': 'Table',
            'scoreValue': 1,
          },
          {
            'scoreName': 'Penny',
            'scoreValue': 1,
          },
        ]
      },
    ]
  },
  {
    'id': 5,
    'questionName': 'Language and Praxis',
    'fields': [
      {
        'fieldId': 1,
        'fieldName': 'question5.1',
        'fieldPointName': 'question5.1_point',
        'fieldPointValue': 0,
        'fieldLabel':
            'Show the patient two simple objects, and ask the patient to name them',
        'fieldScores': [
          {
            'scoreName': 'What is the name of this object? (show wristwatch)',
            'scoreValue': 1,
          },
          {
            'scoreName': 'What is the name of this object? (show pencil)',
            'scoreValue': 1,
          },
        ]
      },
      {
        'fieldId': 2,
        'fieldName': 'question5.2',
        'fieldPointName': 'question5.2_point',
        'fieldLabel':
            'Ask the patient to repeat the sentence after you. Allow only one trial',
        'fieldPointValue': 0,
        'fieldScores': [
          {
            'scoreName': 'No ifs, ands, or buts',
            'scoreValue': 1,
          },
        ]
      },
      {
        'fieldId': 3,
        'fieldName': 'question5.3',
        'fieldPointName': 'question5.3_point',
        'fieldLabel':
            'Give the patient a piece of blank paper and follow these instructions',
        'fieldPointValue': 0,
        'fieldScores': [
          {
            'scoreName': 'Take this paper in your right hand',
            'scoreValue': 1,
          },
          {
            'scoreName': 'Fold it in half',
            'scoreValue': 1,
          },
          {
            'scoreName': 'Put it on the floor',
            'scoreValue': 1,
          },
        ]
      },
      {
        'fieldId': 4,
        'fieldName': 'question5.4',
        'fieldPointName': 'question5.4_point',
        'fieldLabel':
            'On a blank piece of paper print the sentence, "Close your eyes," in letters large enough for the patient to see clearly. Ask the patient to read the sentence and do what it says',
        'fieldPointValue': 0,
        'fieldScores': [
          {
            'scoreName': 'Close your eyes',
            'scoreValue': 1,
          },
        ]
      },
      {
        'fieldId': 5,
        'fieldName': 'question5.5',
        'fieldPointName': 'question5.5_point',
        'fieldLabel':
            'Ask the patient to make up and write a sentence about anything (This sentence must contain a noun and a verb)',
        'fieldPointValue': 0,
        'fieldScores': [
          {
            'scoreName': 'Sentence acceptable',
            'scoreValue': 1,
          },
        ]
      },
      {
        'fieldId': 6,
        'fieldName': 'question5.6',
        'fieldPointName': 'question5.6_point',
        'fieldPointValue': 0,
        'fieldImageAssets':
            'assets/images/symbol_dua_segi5_gambar_10_sudut.png',
        'fieldLabel':
            'Please copy this picture.(The examiner gives the patient a blank piece of paper and ask the patient to draw the symbol below. All 10 angles must be present and two must intersect)',
        'fieldScores': [
          {
            'scoreName': 'Picture acceptable',
            'scoreValue': 1,
          },
        ]
      },
    ]
  },
];
