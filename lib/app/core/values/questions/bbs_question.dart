const bbsQuestions = [
  {
    'fieldId': 1,
    'fieldName': 'question1',
    'fieldPointName': 'question1_point',
    'fieldLabel': 'Sitting to standing',
    'fieldScores': [
      {
        'scoreName':
            'Able to stand without using hands and stabilize independently',
        'scoreValue': 4,
      },
      {
        'scoreName': 'Able to stand independently using hands',
        'scoreValue': 3,
      },
      {
        'scoreName': 'Able to stand using hands after several tries',
        'scoreValue': 2,
      },
      {
        'scoreName': 'Needs minimal aid to stand or to stabilize',
        'scoreValue': 1,
      },
      {
        'scoreName': 'Needs moderate or maximal assist to stand',
        'scoreValue': 0,
      },
    ]
  },
  {
    'fieldId': 2,
    'fieldName': 'question2',
    'fieldPointName': 'question2_point',
    'fieldLabel': 'Standing unsupported',
    'fieldScores': [
      {
        'scoreName': 'Able to stand safely 2 minutes',
        'scoreValue': 4,
      },
      {
        'scoreName': 'Able to stand 2 minutes with supervision',
        'scoreValue': 3,
      },
      {
        'scoreName': 'Able to stand 30 seconds unsupported',
        'scoreValue': 2,
      },
      {
        'scoreName': 'Needs several tries to stand 30 seconds unsupported',
        'scoreValue': 1,
      },
      {
        'scoreName': 'Unable to stand 30 seconds unassisted',
        'scoreValue': 0,
      },
    ]
  },
  {
    'fieldId': 3,
    'fieldName': 'question3',
    'fieldPointName': 'question3_point',
    'fieldLabel':
        'Sitting with back unsupported but feet supported on floor or on a stool',
    'fieldScores': [
      {
        'scoreName': 'Able to sit safely and securely 2 minutes',
        'scoreValue': 4,
      },
      {
        'scoreName': 'Able to sit 2 minutes under supervision',
        'scoreValue': 3,
      },
      {
        'scoreName': 'Able to sit 30 seconds',
        'scoreValue': 2,
      },
      {
        'scoreName': 'Able to sit 10 seconds',
        'scoreValue': 1,
      },
      {
        'scoreName': 'Unable to sit without support 10 seconds',
        'scoreValue': 0,
      },
    ]
  },
  {
    'fieldId': 4,
    'fieldName': 'question4',
    'fieldPointName': 'question4_point',
    'fieldLabel': 'Standing to sitting',
    'fieldScores': [
      {
        'scoreName': 'Sits safely with minimal use of hands',
        'scoreValue': 4,
      },
      {
        'scoreName': 'Controls descent by using hands',
        'scoreValue': 3,
      },
      {
        'scoreName': 'Uses back of legs against chair to control descent',
        'scoreValue': 2,
      },
      {
        'scoreName': 'Sits independently but has uncontrolled descent',
        'scoreValue': 1,
      },
      {
        'scoreName': 'Needs assistance to sit',
        'scoreValue': 0,
      },
    ]
  },
  {
    'fieldId': 5,
    'fieldName': 'question5',
    'fieldPointName': 'question5_point',
    'fieldLabel': 'Transfers',
    'fieldScores': [
      {
        'scoreName': 'Able to transfer safely with minor use of hands',
        'scoreValue': 4,
      },
      {
        'scoreName': 'Able to transfer safely definite need of hands',
        'scoreValue': 3,
      },
      {
        'scoreName': 'Able to transfer with verbal cueing and/or supervision',
        'scoreValue': 2,
      },
      {
        'scoreName': 'Needs one person to assist',
        'scoreValue': 1,
      },
      {
        'scoreName': 'Needs two people to assist or supervise to be safe',
        'scoreValue': 0,
      },
    ]
  },
  {
    'fieldId': 6,
    'fieldName': 'question6',
    'fieldPointName': 'question6_point',
    'fieldLabel': 'Standing with eyes closed',
    'fieldScores': [
      {
        'scoreName': 'Able to stand 10 seconds safely',
        'scoreValue': 4,
      },
      {
        'scoreName': 'Able to stand 10 seconds with supervision',
        'scoreValue': 3,
      },
      {
        'scoreName': 'Able to stand 3 seconds',
        'scoreValue': 2,
      },
      {
        'scoreName': 'Unable to keep eyes closed 3 seconds but stays steady',
        'scoreValue': 1,
      },
      {
        'scoreName': 'Needs help to keep from falling',
        'scoreValue': 0,
      },
    ]
  },
  {
    'fieldId': 7,
    'fieldName': 'question7',
    'fieldPointName': 'question7_point',
    'fieldLabel': 'Standing with feet together',
    'fieldScores': [
      {
        'scoreName':
            'Able to place feet together independently and stand 1 minute safely',
        'scoreValue': 4,
      },
      {
        'scoreName':
            'Able to place feet together independently and stand for 1 minute with supervision',
        'scoreValue': 3,
      },
      {
        'scoreName':
            'Able to place feet together independently but unable to hold for 30 seconds',
        'scoreValue': 2,
      },
      {
        'scoreName':
            'Needs help to attain position but able to stand 15 seconds with feet together',
        'scoreValue': 1,
      },
      {
        'scoreName':
            'Needs help to attain position and unable to hold for 15 seconds',
        'scoreValue': 0,
      },
    ]
  },
  {
    'fieldId': 8,
    'fieldName': 'question8',
    'fieldPointName': 'question8_point',
    'fieldLabel': 'Reaching forward with outstretched arm while standing',
    'fieldScores': [
      {
        'scoreName': 'Can reach forward confidently >25 cm (10 inches)',
        'scoreValue': 4,
      },
      {
        'scoreName': 'Can reach forward >12 cm safely (5 inches)',
        'scoreValue': 3,
      },
      {
        'scoreName': 'Can reach forward >5 cm safely (2 inches)',
        'scoreValue': 2,
      },
      {
        'scoreName': 'Reaches forward but needs supervision',
        'scoreValue': 1,
      },
      {
        'scoreName': 'Loses balance while trying/requires external support',
        'scoreValue': 0,
      },
    ]
  },
  {
    'fieldId': 9,
    'fieldName': 'question9',
    'fieldPointName': 'question9_point',
    'fieldLabel': 'Pick up object from the floor from a standing position',
    'fieldScores': [
      {
        'scoreName': 'Able to pick up slipper safely and easily',
        'scoreValue': 4,
      },
      {
        'scoreName': 'Able to pick up slipper but needs supervision',
        'scoreValue': 3,
      },
      {
        'scoreName':
            'Unable to pick up but reaches 2-5cm (1-2 inches) from slipper and keeps balance independently',
        'scoreValue': 2,
      },
      {
        'scoreName': 'Unable to pick up and needs supervision while trying',
        'scoreValue': 1,
      },
      {
        'scoreName':
            'Unable to try/needs assist to keep from losing balance or falling',
        'scoreValue': 0,
      },
    ]
  },
  {
    'fieldId': 10,
    'fieldName': 'question10',
    'fieldPointName': 'question10_point',
    'fieldLabel':
        'Turning to look behind over left and right shoulders while standing',
    'fieldScores': [
      {
        'scoreName': 'Looks behind from both sides and weight shifts well',
        'scoreValue': 4,
      },
      {
        'scoreName':
            'Looks behind one side only other side shows less weight shift',
        'scoreValue': 3,
      },
      {
        'scoreName': 'Turns sideways only but maintains balance',
        'scoreValue': 2,
      },
      {
        'scoreName': 'Needs supervision when turning',
        'scoreValue': 1,
      },
      {
        'scoreName': 'Needs assist to keep from losing balance or falling',
        'scoreValue': 0,
      },
    ]
  },
  {
    'fieldId': 11,
    'fieldName': 'question11',
    'fieldPointName': 'question11_point',
    'fieldLabel': 'Turning 360 degrees',
    'fieldScores': [
      {
        'scoreName': 'Able to turn 360 degrees safely in 4 seconds or less',
        'scoreValue': 4,
      },
      {
        'scoreName':
            'Able to turn 360 degrees safely one side only in 4 seconds or less',
        'scoreValue': 3,
      },
      {
        'scoreName': 'Able to turn 360 degrees safely but slowly',
        'scoreValue': 2,
      },
      {
        'scoreName': 'Needs close supervision or verbal cueing',
        'scoreValue': 1,
      },
      {
        'scoreName': 'Needs assistance while turning',
        'scoreValue': 0,
      },
    ]
  },
  {
    'fieldId': 12,
    'fieldName': 'question12',
    'fieldPointName': 'question12_point',
    'fieldLabel':
        'Place alternate foot on step/stool while standing unsupported',
    'fieldScores': [
      {
        'scoreName':
            'Able to stand independently and safely and complete 8 steps in 20 seconds',
        'scoreValue': 4,
      },
      {
        'scoreName':
            'Able to stand independently and complete 8 steps in >20 seconds',
        'scoreValue': 3,
      },
      {
        'scoreName': 'Able to complete 4 steps without aid with supervision',
        'scoreValue': 2,
      },
      {
        'scoreName': 'Able to complete >2 steps needs minimal assist',
        'scoreValue': 1,
      },
      {
        'scoreName': 'Needs assistance to keep from falling/unable to try',
        'scoreValue': 0,
      },
    ]
  },
  {
    'fieldId': 13,
    'fieldName': 'question13',
    'fieldPointName': 'question13_point',
    'fieldLabel': 'Standing with one foot in front',
    'fieldScores': [
      {
        'scoreName':
            'Able to place foot tandem independently and hold 30 seconds',
        'scoreValue': 4,
      },
      {
        'scoreName':
            'Able to place foot ahead of other independently and hold 30 seconds',
        'scoreValue': 3,
      },
      {
        'scoreName':
            'Able to take small step independently and hold 30 seconds',
        'scoreValue': 2,
      },
      {
        'scoreName': 'Needs help to step but can hold 15 seconds',
        'scoreValue': 1,
      },
      {
        'scoreName': 'Loses balance while stepping or standing',
        'scoreValue': 0,
      },
    ]
  },
  {
    'fieldId': 14,
    'fieldName': 'question14',
    'fieldPointName': 'question14_point',
    'fieldLabel': 'Standing on one leg',
    'fieldScores': [
      {
        'scoreName': 'Able to lift leg independently and hold >10 seconds',
        'scoreValue': 4,
      },
      {
        'scoreName': 'Able to lift leg independently and hold 5-10 seconds',
        'scoreValue': 3,
      },
      {
        'scoreName': 'Able to lift leg independently and hold = or >3 seconds',
        'scoreValue': 2,
      },
      {
        'scoreName':
            'Tries to lift leg unable to hold 3 seconds but remains standing independently',
        'scoreValue': 1,
      },
      {
        'scoreName': 'Unable to try or needs assist to prevent fall',
        'scoreValue': 0,
      },
    ]
  }
];
