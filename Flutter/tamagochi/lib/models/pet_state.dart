enum PetState {
  happy,
  happy_animated,  // Feliz (animado)
  sad,
  sad_animated,    // Triste (animado) 
  hungry,
  hungry_animated, // Com fome (animado)
  sick,
  sick_animated,   // Doente (animado)
  idle,            // Ocioso (animado)
  sleeping,        // Dormindo (animado)
  eating           // Comendo (animado)
}

extension PetStatePatterns on PetState {
  List<List<bool>> get pixelPattern {
    switch (this) {
      case PetState.happy:
        return _happyFrame;
      case PetState.sad:
        return _sadFrame;
      case PetState.hungry:
        return _hungryFrame;
      case PetState.sick:
        return _sickFrame;
      case PetState.happy_animated:
        return _getHappyAnimation();
      case PetState.sad_animated:
        return _getSadAnimation();
      case PetState.hungry_animated:
        return _getHungryAnimation();
      case PetState.sick_animated:
        return _getSickAnimation();
      case PetState.idle:
        return _getIdleAnimation();
      case PetState.sleeping:
        return _getSleepingAnimation();
      case PetState.eating:
        return _getEatingAnimation();
    }
  }

  // ========== ANIMAÇÕES ========== //

  // List<List<bool>> _getHappyAnimation() {
  //   final frame = DateTime.now().millisecond ~/ 300 % 4;
  //   switch (frame) {
  //     case 0: return _happyFrame;
  //     case 1: return _happyFrame2;
  //     case 2: return _happyFrame3;
  //     default: return _happyFrame2;
  //   }
  // }

  List<List<bool>> _getHappyAnimation() {
  final frame = DateTime.now().millisecond ~/ 300 % 3; // 3 frames (0, 1, 2)
  switch (frame) {
      case 0: return _happyFrame;  // Frame original
      case 1: return _happyFrame2; // Pequena variação
      default: return _happyFrame3; // Maior abertura
    }
  }

  List<List<bool>> _getSadAnimation() {
    final frame = DateTime.now().millisecond ~/ 400 % 3;
    switch (frame) {
      case 0: return _sadFrame;
      case 1: return _sadFrame2;
      default: return _sadFrame3;
    }
  }

  List<List<bool>> _getHungryAnimation() {
    final frame = DateTime.now().millisecond ~/ 200 % 5;
    switch (frame) {
      case 0: return _hungryFrame;
      case 1: return _hungryFrame2;
      case 2: return _hungryFrame3;
      case 3: return _hungryFrame4;
      default: return _hungryFrame;
    }
  }

  List<List<bool>> _getSickAnimation() {
    final frame = DateTime.now().millisecond ~/ 500 % 3;
    switch (frame) {
      case 0: return _sickFrame;
      case 1: return _sickFrame2;
      default: return _sickFrame;
    }
  }

  List<List<bool>> _getIdleAnimation() {
    final frame = DateTime.now().millisecond ~/ 800 % 4;
    switch (frame) {
      case 0: return _idleFrame1;
      case 1: return _idleFrame2;
      case 2: return _idleFrame3;
      default: return _idleFrame2;
    }
  }

  List<List<bool>> _getSleepingAnimation() {
    final frame = DateTime.now().millisecond ~/ 600 % 3;
    switch (frame) {
      case 0: return _sleepFrame1;
      case 1: return _sleepFrame2;
      default: return _sleepFrame3;
    }
  }

  List<List<bool>> _getEatingAnimation() {
    final frame = DateTime.now().millisecond ~/ 150 % 6;
    switch (frame) {
      case 0: return _eatFrame1;
      case 1: return _eatFrame2;
      case 2: return _eatFrame3;
      case 3: return _eatFrame4;
      case 4: return _eatFrame3;
      default: return _eatFrame2;
    }
  }

  // ========== FRAMES ESTÁTICOS ========== //

  static final _happyFrame = [
  [false, false, false, false, false, true,  true,  true,  true,  true,  true,  false, false, false, false, false],
  [false, false, false, false, true,  false, false, false, false, false, false, true,  false, false, false, false],
  [false, false, false, true,  false, false, false, false, false, false, false, false, true,  false, false, false],
  [false, false, true,  false, false, false, false, false, false, false, false, false, false, true,  false, false],
  [false, true,  false, false, false, true,  false, false, false, false, true,  false, false, false, true,  false],
  [true,  false, false, false, false, false, false, false, false, false, false, false, false, false, false, true ],
  [true,  false, false, true, false, false,  false, false, false, false, false,  false, true, false, false, true ],
  [true,  false, false, true, true, true, true,  true,  true,  true,  true, true, true, false, false, true ],
  [true,  false, false, true, true, true, true, true, true, true, true, true, true, false, false, true ],
  [true,  false, false, true, true, true,  true, true, true, true, true,  true, true, false, false, true ],
  [true, false,  false, true, true, true, true,  true,  true,  true,  true, true, true, false, false, true],
  [true, false, false,  true, true, true, true, true, true, true, true, true, true, false,  false, true],
  [false, true, false, false,  true, true, true, true, true, true, true, true, false,  false, true, false],
  [false, false, true, false, false,  false, false, false, false, false, false, false,  false, true, false, false],
  [false, false, false, true, false, false,  false,  false,  false,  false,  false,  false, true, false, false, false],
  [false, false, false, false, true, true, true, true, true, true, true, true, false, false, false, false],
];

static final _sadFrame = [
  [false, false, false, false, false, true,  true,  true,  true,  true,  true,  false, false, false, false, false],
  [false, false, false, false, true,  false, false, false, false, false, false, true,  false, false, false, false],
  [false, false, false, true,  false, false, false, false, false, false, false, false, true,  false, false, false],
  [false, false, true,  false, false, false, false, false, false, false, false, false, false, true,  false, false],
  [false, true,  false, false, false, true,  false, false, false, false, true,  false, false, false, true,  false],
  [true,  false, false, false, false, false, false, false, false, false, false, false, false, false, false, true ],
  [true,  false, false, false, false, true,  false, false, false, false, true,  false, false, false, false, true ],
  [true,  false, false, false, false, false, true,  false, false, true,  false, false, false, false, false, true ],
  [true,  false, false, false, false, false, false, true,  true,  false, false, false, false, false, false, true ],
  [true,  false, false, false, false, false, false, false, false, false, false, false, false, false, false, true ],
  [false, true,  false, false, true,  false, false, false, false, false, false, true,  false, false, true,  false],
  [false, false, true,  false, false, true,  false, false, false, false, true,  false, false, true,  false, false],
  [false, false, false, true,  false, false, true,  false, false, true,  false, false, true,  false, false, false],
  [false, false, false, false, true,  false, false, true,  true,  false, false, true,  false, false, false, false],
  [false, false, false, false, false, true,  true,  false, false, true,  true,  false, false, false, false, false],
  [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
];

static final _hungryFrame = [
  [false, false, false, false, false, true,  true,  true,  true,  true,  true,  false, false, false, false, false],
  [false, false, false, false, true,  false, false, false, false, false, false, true,  false, false, false, false],
  [false, false, false, true,  false, false, false, false, false, false, false, false, true,  false, false, false],
  [false, false, true,  false, false, false, false, false, false, false, false, false, false, true,  false, false],
  [false, true,  false, false, false, true,  false, false, false, false, true,  false, false, false, true,  false],
  [true,  false, false, false, false, false, false, false, false, false, false, false, false, false, false, true ],
  [true,  false, false, false, true,  true,  true,  true,  true,  true,  true,  true,  false, false, false, true ],
  [true,  false, false, false, false, false, false, false, false, false, false, false, false, false, false, true ],
  [true,  false, false, false, false, false, false, false, false, false, false, false, false, false, false, true ],
  [true,  false, false, false, true,  true,  true,  true,  true,  true,  true,  true,  false, false, false, true ],
  [false, true,  false, false, false, false, false, false, false, false, false, false, false, false, true,  false],
  [false, false, true,  false, false, true,  true,  false, false, true,  true,  false, false, true,  false, false],
  [false, false, false, true,  false, false, false, true,  true,  false, false, false, true,  false, false, false],
  [false, false, false, false, true,  false, false, false, false, false, false, true,  false, false, false, false],
  [false, false, false, false, false, true,  true,  true,  true,  true,  true,  false, false, false, false, false],
  [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
];

static final _sickFrame = [
  [false, false, false, false, false, true,  true,  true,  true,  true,  true,  false, false, false, false, false],
  [false, false, false, false, true,  false, false, false, false, false, false, true,  false, false, false, false],
  [false, false, false, true,  false, false, false, false, false, false, false, false, true,  false, false, false],
  [false, false, true,  false, false, false, false, false, false, false, false, false, false, true,  false, false],
  [false, true,  false, false, false, true,  false, false, false, false, true,  false, false, false, true,  false],
  [true,  false, false, false, false, false, false, false, false, false, false, false, false, false, false, true ],
  [true,  false, false, false, true,  false, false, true,  true,  false, false, true,  false, false, false, true ],
  [true,  false, false, false, false, true,  false, false, false, false, true,  false, false, false, false, true ],
  [true,  false, false, false, false, false, true,  false, false, true,  false, false, false, false, false, true ],
  [true,  false, false, false, false, false, false, true,  true,  false, false, false, false, false, false, true ],
  [false, true,  false, false, false, false, false, false, false, false, false, false, false, false, true,  false],
  [false, false, true,  true,  true,  false, false, false, false, false, false, true,  true,  true,  false, false],
  [false, false, false, true,  false, true,  false, false, false, false, true,  false, true,  false, false, false],
  [false, false, false, false, true,  false, false, false, false, false, false, true,  false, false, false, false],
  [false, false, false, false, false, true,  true,  true,  true,  true,  true,  false, false, false, false, false],
  [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
];

  // ========== FRAMES DE ANIMAÇÃO ========== //

  // Feliz animado
  static final _happyFrame2 = [
    [false, false, false, false, false, true,  true,  true,  true,  true,  true,  false, false, false, false, false],
    [false, false, false, false, true,  false, false, false, false, false, false, true,  false, false, false, false],
    [false, false, false, true,  false, false, false, false, false, false, false, false, true,  false, false, false],
    [false, false, true,  false, false, false, false, false, false, false, false, false, false, true,  false, false],
    [false, true,  false, false, false, true,  false, false, false, false, true,  false, false, false, true,  false],
    [true,  false, false, false, false, false, false, false, false, false, false, false, false, false, false, true ],
    [true,  false, false, false, false, false,  false, false, false, false, false,  false, false, false, false, true ],
    [true,  false, false, true, false, false, false,  false,  false,  false,  false, false, true, false, false, true ],
    [true,  false, false, true, true, true, true,  true,  true,  true,  true, true, true, false, false, true ],
    [true,  false, false, true, true, true,  true, true, true, true, true,  true, true, false, false, true ],
    [true, false,  false, true, true, true, true,  true,  true,  true,  true, true, true, false, false, true],
    [true, false, false,  true, true, true, true, true, true, true, true, true, true, false,  false, true],
    [false, true, false, false,  true, true, true, true, true, true, true, true, false,  false, true, false],
    [false, false, true, false, false,  false, false, false, false, false, false, false,  false, true, false, false],
    [false, false, false, true, false, false,  false,  false,  false,  false,  false,  false, true, false, false, false],
    [false, false, false, false, true, true, true, true, true, true, true, true, false, false, false, false],
  ];

  static final _happyFrame3 = [
    [false, false, false, false, false, true,  true,  true,  true,  true,  true,  false, false, false, false, false],
    [false, false, false, false, true,  false, false, false, false, false, false, true,  false, false, false, false],
    [false, false, false, true,  false, false, false, false, false, false, false, false, true,  false, false, false],
    [false, false, true,  false, false, false, false, false, false, false, false, false, false, true,  false, false],
    [false, true,  false, false, false, true,  false, false, false, false, true,  false, false, false, true,  false],
    [true,  false, false, false, false, false, false, false, false, false, false, false, false, false, false, true ],
    [true,  false, false, false, false, false,  false, false, false, false, false,  false, false, false, false, true ],
    [true,  false, false, false, false, false, false,  false,  false,  false,  false, false, false, false, false, true ],
    [true,  false, false, true, false, false, false,  false,  false,  false,  false, false, true, false, false, true ],
    [true,  false, false, true, true, true,  true, true, true, true, true,  true, true, false, false, true ],
    [true, false,  false, true, true, true, true,  true,  true,  true,  true, true, true, false, false, true],
    [true, false, false,  true, true, true, true, true, true, true, true, true, true, false,  false, true],
    [false, true, false, false,  true, true, true, true, true, true, true, true, false,  false, true, false],
    [false, false, true, false, false,  false, false, false, false, false, false, false,  false, true, false, false],
    [false, false, false, true, false, false,  false,  false,  false,  false,  false,  false, true, false, false, false],
    [false, false, false, false, true, true, true, true, true, true, true, true, false, false, false, false],
  ];

  // Triste animado
  static final _sadFrame2 = [
    [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
    [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
    [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
    [false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false],
    [false, true, false, false, false, true, false, false, false, false, true, false, false, false, true, false],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, false, true, false, false, false, false, true, false, false, false, false, true],
    [true, false, false, false, false, false, true, false, false, true, false, false, false, false, false, true],
    [true, false, false, false, false, false, false, true, true, false, false, false, false, false, false, true],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [false, true, false, false, false, false, true, true, true, true, false, false, false, false, true, false],
    [false, false, true, false, false, true, false, false, false, false, true, false, false, true, false, false],
    [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
    [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
    [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
    [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
  ];

  static final _sadFrame3 = [
    [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
    [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
    [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
    [false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false],
    [false, true, false, false, false, true, false, false, false, false, true, false, false, false, true, false],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, false, true, false, false, false, false, true, false, false, false, false, true],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, false, false, true, true, true, true, false, false, false, false, false, true],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [false, true, false, false, false, false, true, true, true, true, false, false, false, false, true, false],
    [false, false, true, false, false, true, false, false, false, false, true, false, false, true, false, false],
    [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
    [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
    [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
    [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
  ];

  // Com fome animado
  static final _hungryFrame2 = [
    [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
    [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
    [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
    [false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false],
    [false, true, false, false, false, true, false, false, false, false, true, false, false, false, true, false],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, true, true, true, true, true, true, true, true, false, false, false, true],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [false, true, false, false, false, false, false, false, false, false, false, false, false, false, true, false],
    [false, false, true, false, false, false, true, true, true, true, false, false, false, true, false, false],
    [false, false, false, true, false, true, false, false, false, false, true, false, true, false, false, false],
    [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
    [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
    [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
  ];

  static final _hungryFrame3 = [
    [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
    [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
    [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
    [false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false],
    [false, true, false, false, false, true, false, false, false, false, true, false, false, false, true, false],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, false, false, true, true, true, true, false, false, false, false, false, true],
    [true, false, false, false, false, true, false, false, false, false, true, false, false, false, false, true],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, false, false, true, true, true, true, false, false, false, false, false, true],
    [false, true, false, false, false, false, false, false, false, false, false, false, false, false, true, false],
    [false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false],
    [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
    [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
    [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
    [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
  ];

  static final _hungryFrame4 = [
    [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
    [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
    [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
    [false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false],
    [false, true, false, false, false, true, false, false, false, false, true, false, false, false, true, false],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, false, false, true, true, true, true, false, false, false, false, false, true],
    [true, false, false, false, false, true, false, false, false, false, true, false, false, false, false, true],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, false, false, true, true, true, true, false, false, false, false, false, true],
    [false, true, false, false, false, false, false, true, true, false, false, false, false, false, true, false],
    [false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false],
    [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
    [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
    [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
    [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
  ];

  // Doente animado
  static final _sickFrame2 = [
    [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
    [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
    [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
    [false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false],
    [false, true, false, false, false, true, false, false, false, false, true, false, false, false, true, false],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, true, false, false, true, true, false, false, true, false, false, false, true],
    [true, false, false, false, false, true, false, false, false, false, true, false, false, false, false, true],
    [true, false, false, false, false, false, true, false, false, true, false, false, false, false, false, true],
    [true, false, false, false, false, false, false, true, true, false, false, false, false, false, false, true],
    [false, true, false, false, false, false, false, false, false, false, false, false, false, false, true, false],
    [false, false, true, true, true, false, false, false, false, false, false, true, true, true, false, false],
    [false, false, false, true, false, true, false, false, false, false, true, false, true, false, false, false],
    [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
    [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
    [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
  ];

  // Ocioso
  static final _idleFrame1 = [
    [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
    [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
    [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
    [false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false],
    [false, true, false, false, false, true, false, false, false, false, true, false, false, false, true, false],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, false, true, false, false, false, false, true, false, false, false, false, true],
    [true, false, false, false, false, false, true, true, true, true, false, false, false, false, false, true],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, false, true, false, false, false, false, true, false, false, false, false, true],
    [false, true, false, false, false, false, true, true, true, true, false, false, false, false, true, false],
    [false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false],
    [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
    [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
    [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
    [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
  ];

  static final _idleFrame2 = [
    [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
    [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
    [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
    [false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false],
    [false, true, false, false, false, true, false, false, false, false, true, false, false, false, true, false],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, false, true, false, false, false, false, true, false, false, false, false, true],
    [true, false, false, false, false, false, true, true, true, true, false, false, false, false, false, true],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, false, true, false, false, false, false, true, false, false, false, false, true],
    [false, true, false, false, false, false, true, true, true, true, false, false, false, false, true, false],
    [false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false],
    [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
    [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
    [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
    [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
  ];

  static final _idleFrame3 = [
    [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
    [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
    [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
    [false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false],
    [false, true, false, false, false, true, false, false, false, false, true, false, false, false, true, false],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, false, true, false, false, false, false, true, false, false, false, false, true],
    [true, false, false, false, false, false, true, true, true, true, false, false, false, false, false, true],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, false, true, false, false, false, false, true, false, false, false, false, true],
    [false, true, false, false, false, false, true, true, true, true, false, false, false, false, true, false],
    [false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false],
    [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
    [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
    [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
    [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
  ];

  // Dormindo
  static final _sleepFrame1 = [
    [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
    [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
    [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
    [false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false],
    [false, true, false, false, false, true, false, false, false, false, true, false, false, false, true, false],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, false, false, true, true, true, true, false, false, false, false, false, true],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, false, false, true, true, true, true, false, false, false, false, false, true],
    [false, true, false, false, false, false, false, false, false, false, false, false, false, false, true, false],
    [false, false, true, false, false, true, true, false, false, true, true, false, false, true, false, false],
    [false, false, false, true, false, false, false, true, true, false, false, false, true, false, false, false],
    [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
    [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
    [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
  ];

  static final _sleepFrame2 = [
    [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
    [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
    [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
    [false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false],
    [false, true, false, false, false, true, false, false, false, false, true, false, false, false, true, false],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, false, false, true, true, true, true, false, false, false, false, false, true],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, false, false, true, true, true, true, false, false, false, false, false, true],
    [false, true, false, false, false, false, false, false, false, false, false, false, false, false, true, false],
    [false, false, true, false, false, false, true, true, false, false, true, true, false, true, false, false],
    [false, false, false, true, false, false, false, false, true, true, false, false, true, false, false, false],
    [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
    [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
    [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
  ];

  static final _sleepFrame3 = [
    [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
    [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
    [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
    [false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false],
    [false, true, false, false, false, true, false, false, false, false, true, false, false, false, true, false],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, false, false, true, true, true, true, false, false, false, false, false, true],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, false, false, true, true, true, true, false, false, false, false, false, true],
    [false, true, false, false, false, false, false, false, false, false, false, false, false, false, true, false],
    [false, false, true, false, false, false, false, true, true, false, false, true, true, true, false, false],
    [false, false, false, true, false, false, false, false, false, true, true, false, false, false, false, false],
    [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
    [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
    [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
  ];

  // Comendo
  static final _eatFrame1 = [
    [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
    [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
    [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
    [false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false],
    [false, true, false, false, false, true, false, false, false, false, true, false, false, false, true, false],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, false, false, true, true, true, true, false, false, false, false, false, true],
    [true, false, false, false, false, true, false, false, false, false, true, false, false, false, false, true],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, false, false, true, true, true, true, false, false, false, false, false, true],
    [false, true, false, false, false, false, false, false, false, false, false, false, false, false, true, false],
    [false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false],
    [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
    [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
    [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
    [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
  ];

  static final _eatFrame2 = [
    [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
    [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
    [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
    [false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false],
    [false, true, false, false, false, true, false, false, false, false, true, false, false, false, true, false],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, true, true, true, true, true, true, true, true, false, false, false, true],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [false, true, false, false, false, false, false, false, false, false, false, false, false, false, true, false],
    [false, false, true, false, false, false, true, true, true, true, false, false, false, true, false, false],
    [false, false, false, true, false, true, false, false, false, false, true, false, true, false, false, false],
    [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
    [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
    [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
  ];

  static final _eatFrame3 = [
    [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
    [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
    [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
    [false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false],
    [false, true, false, false, false, true, false, false, false, false, true, false, false, false, true, false],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, false, false, true, true, true, true, false, false, false, false, false, true],
    [true, false, false, false, false, true, false, true, true, false, true, false, false, false, false, true],
    [true, false, false, false, false, false, true, true, true, true, false, false, false, false, false, true],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [false, true, false, false, false, false, false, false, false, false, false, false, false, false, true, false],
    [false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false],
    [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
    [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
    [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
    [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
  ];

  static final _eatFrame4 = [
    [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
    [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
    [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
    [false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false],
    [false, true, false, false, false, true, false, false, false, false, true, false, false, false, true, false],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, true, true, true, true, true, true, true, true, false, false, false, true],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
    [false, true, false, false, false, false, false, false, false, false, false, false, false, false, true, false],
    [false, false, true, false, false, false, true, true, true, true, false, false, false, true, false, false],
    [false, false, false, true, false, true, false, false, false, false, true, false, true, false, false, false],
    [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
    [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
    [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
  ];
}

// extension PetStatePatterns on PetState {
//   List<List<bool>> get pixelPattern {
//     switch (this) {
//       case PetState.happy:
//         return [
//           [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
//           [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
//           [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
//           [false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false],
//           [false, true, false, false, false, true, false, false, false, false, true, false, false, false, true, false],
//           [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
//           [true, false, false, false, true, false, false, false, false, false, false, true, false, false, false, true],
//           [true, false, false, false, false, true, true, false, false, true, true, false, false, false, false, true],
//           [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
//           [true, false, false, true, false, false, false, false, false, false, false, false, true, false, false, true],
//           [false, true, false, false, true, false, false, false, false, false, false, true, false, false, true, false],
//           [false, false, true, false, false, true, true, true, true, true, true, false, false, true, false, false],
//           [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
//           [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
//           [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
//           [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
//         ];
//       case PetState.sad:
//         return [
//           [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
//           [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
//           [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
//           [false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false],
//           [false, true, false, false, false, true, false, false, false, false, true, false, false, false, true, false],
//           [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
//           [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
//           [true, false, false, false, false, true, true, false, false, true, true, false, false, false, false, true],
//           [true, false, false, false, true, false, false, true, true, false, false, true, false, false, false, true],
//           [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
//           [false, true, false, false, false, false, false, false, false, false, false, false, false, false, true, false],
//           [false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false],
//           [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
//           [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
//           [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
//           [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
//         ];
//       case PetState.hungry:
//         return [
//           [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
//           [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
//           [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
//           [false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false],
//           [false, true, false, false, false, true, false, false, false, false, true, false, false, false, true, false],
//           [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
//           [true, false, false, false, false, false, true, true, true, true, false, false, false, false, false, true],
//           [true, false, false, false, false, true, false, false, false, false, true, false, false, false, false, true],
//           [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
//           [true, false, false, false, false, false, true, true, true, true, false, false, false, false, false, true],
//           [false, true, false, false, false, false, false, false, false, false, false, false, false, false, true, false],
//           [false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false],
//           [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
//           [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
//           [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
//           [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
//         ];
//       case PetState.sick:
//         return [
//           [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
//           [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
//           [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
//           [false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, false],
//           [false, true, false, false, false, true, false, false, false, false, true, false, false, false, true, false],
//           [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true],
//           [true, false, false, false, true, false, false, true, true, false, false, true, false, false, false, true],
//           [true, false, false, false, false, true, false, false, false, false, true, false, false, false, false, true],
//           [true, false, false, false, false, false, true, false, false, true, false, false, false, false, false, true],
//           [true, false, false, false, false, false, false, true, true, false, false, false, false, false, false, true],
//           [false, true, false, false, false, false, false, false, false, false, false, false, false, false, true, false],
//           [false, false, true, false, false, true, true, true, true, true, true, false, false, true, false, false],
//           [false, false, false, true, false, false, false, false, false, false, false, false, true, false, false, false],
//           [false, false, false, false, true, false, false, false, false, false, false, true, false, false, false, false],
//           [false, false, false, false, false, true, true, true, true, true, true, false, false, false, false, false],
//           [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false],
//         ];
//       case PetState.happy_animated:
//         return _getAnimatedPattern(PetState.happy);
//       case PetState.sad_animated:
//         return _getAnimatedPattern(PetState.sad);
//       case PetState.hungry_animated:
//         return _getAnimatedPattern(PetState.hungry);
//       case PetState.sick_animated:
//         return _getAnimatedPattern(PetState.sick);
//       case PetState.idle:
//         return _getIdleAnimation();
//       case PetState.sleeping:
//         return _getSleepingAnimation();
//       case PetState.eating:
//         return _getEatingAnimation();
    
      
//     }
//   }

//   List<List<bool>> _getAnimatedPattern(PetState baseState) {
//     // Padrão de animação básica (piscar)
//     final basePattern = baseState.pixelPattern;
//     final animatedPattern = List.generate(basePattern.length, 
//         (i) => List<bool>.from(basePattern[i]));
    
//     // Modifica alguns pixels para criar efeito de animação
//     if (DateTime.now().millisecond ~/ 500 % 2 == 0) {
//       // Exemplo: piscar os olhos
//       animatedPattern[5][5] = !animatedPattern[5][5];
//       animatedPattern[5][10] = !animatedPattern[5][10];
//     }
//     return animatedPattern;
//   }

//   List<List<bool>> _getIdleAnimation() {
//     // Animação de ocioso (respirando)
//     final frame = DateTime.now().millisecond ~/ 300 % 4;
//     switch (frame) {
//       case 0: return _idleFrame1;
//       case 1: return _idleFrame2;
//       case 2: return _idleFrame3;
//       default: return _idleFrame2;
//     }
//   }

//   List<List<bool>> _getSleepingAnimation() {
//     // Animação de dormindo (zzz)
//     final frame = DateTime.now().millisecond ~/ 500 % 3;
//     switch (frame) {
//       case 0: return _sleepFrame1;
//       case 1: return _sleepFrame2;
//       default: return _sleepFrame3;
//     }
//   }

//   List<List<bool>> _getEatingAnimation() {
//     // Animação de comendo
//     final frame = DateTime.now().millisecond ~/ 200 % 4;
//     switch (frame) {
//       case 0: return _eatFrame1;
//       case 1: return _eatFrame2;
//       case 2: return _eatFrame3;
//       default: return _eatFrame2;
//     }
//   }

//   // Defina os frames de animação aqui:
//   static final _idleFrame1 = [...];
//   static final _idleFrame2 = [...];
//   static final _idleFrame3 = [...];
//   static final _sleepFrame1 = [...];
//   static final _sleepFrame2 = [...];
//   static final _sleepFrame3 = [...];
//   static final _eatFrame1 = [...];
//   static final _eatFrame2 = [...];
//   static final _eatFrame3 = [...];
// }