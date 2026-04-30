import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

// Import kedua file komponen painter
import 'road_painter.dart';
import 'stickman_painter.dart';

class FragileDeliveryGame extends StatefulWidget {
  const FragileDeliveryGame({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const FragileDeliveryGame());
  }

  @override
  State<FragileDeliveryGame> createState() => _FragileDeliveryGameState();
}

class _FragileDeliveryGameState extends State<FragileDeliveryGame>
    with SingleTickerProviderStateMixin {
  double plankAngle = 0.0;
  double boxX = 0.0;
  double boxVelocity = 0.0;

  final List<int> durationLevels = [10, 30, 60, 180, 300];
  int selectedDuration = 30;
  double timeElapsed = 0.0;
  int timeLeft = 30;
  int totalSum = 0;
  int lastScoredSecond = 0;

  bool isPlaying = false;
  bool isGameOver = false;
  bool isBroken = false;

  StreamSubscription<GyroscopeEvent>? _gyroSub;
  StreamSubscription<UserAccelerometerEvent>? _accelSub;
  Timer? _physicsTimer;

  late AnimationController _walkAnimationController;

  @override
  void initState() {
    super.initState();
    _walkAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  void startGame() {
    setState(() {
      plankAngle = 0.0;
      boxX = 0.0;
      boxVelocity = 0.0;
      timeElapsed = 0.0;
      timeLeft = selectedDuration;
      totalSum = 0;
      lastScoredSecond = 0;
      isPlaying = true;
      isGameOver = false;
      isBroken = false;
    });

    _walkAnimationController.repeat(reverse: true);

    _physicsTimer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      if (!isPlaying) return;
      setState(() {
        timeElapsed += 0.016;
        timeLeft = max(0, selectedDuration - timeElapsed.floor());

        int currentSecond = timeElapsed.floor();
        if (currentSecond > lastScoredSecond &&
            currentSecond <= selectedDuration) {
          int points = max(0, 10 - (boxX.abs() * 10).toInt());
          totalSum += points;
          lastScoredSecond = currentSecond;
        }

        boxVelocity += sin(plankAngle) * 0.02;
        boxVelocity *= 0.95;
        boxX += boxVelocity;

        if (boxX < -1.2 || boxX > 1.2) {
          loseGame('Barang Tergelincir!\nPapan terlalu miring.');
        } else if (timeElapsed >= selectedDuration) {
          winGame();
        }
      });
    });

    _gyroSub = gyroscopeEvents.listen((event) {
      if (!isPlaying) return;
      setState(() {
        plankAngle += event.y * 0.03;
        plankAngle = plankAngle.clamp(-0.8, 0.8);
      });
    });

    _accelSub = userAccelerometerEvents.listen((event) {
      if (!isPlaying) return;
      double gForce = sqrt(
        event.x * event.x + event.y * event.y + event.z * event.z,
      );
      if (gForce > 8.0) {
        loseGame('Barang Pecah!\nTerdeteksi guncangan keras.');
      }
    });
  }

  void loseGame(String reason) {
    stopGameLogic();
    setState(() {
      isPlaying = false;
      isGameOver = true;
      isBroken = true;
    });

    showResultDialog(
      'Gagal Diantar!',
      totalSum,
      'G A G A L',
      Colors.redAccent,
      reason,
    );
  }

  void winGame() {
    stopGameLogic();
    setState(() {
      isPlaying = false;
      isGameOver = true;
      timeLeft = 0;
    });

    String tierName = '';
    Color tierColor = Colors.white;
    String tierDesc = '';

    if (selectedDuration == 300 && totalSum >= 2800) {
      tierName = 'L E G E N D A R Y';
      tierColor = Colors.amberAccent;
      tierDesc = 'Akurasi Dewa (5 Menit)';
    } else if (selectedDuration >= 180 && totalSum >= 1550) {
      tierName = 'E P I C';
      tierColor = Colors.purpleAccent;
      tierDesc = 'Sangat Stabil (Min. 3 Menit)';
    } else if (selectedDuration >= 60 && totalSum >= 480) {
      tierName = 'R A R E';
      tierColor = Colors.blueAccent;
      tierDesc = 'Cukup Stabil (Min. 1 Menit)';
    } else if (selectedDuration >= 30 && totalSum >= 200) {
      tierName = 'U N C O M M O N';
      tierColor = Colors.greenAccent;
      tierDesc = 'Pemula (Min. 30 Detik)';
    } else {
      tierName = 'C O M M O N';
      tierColor = Colors.grey[400]!;
      tierDesc = 'Yang Penting Sampai';
    }

    showResultDialog(
      'Tujuan Tercapai!',
      totalSum,
      tierName,
      tierColor,
      tierDesc,
    );
  }

  void showResultDialog(
    String title,
    int skorAkhir,
    String tierName,
    Color tierColor,
    String tierDesc,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900]!.withOpacity(0.7),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: tierColor, width: 2),
          ),
          contentPadding: const EdgeInsets.all(25),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.stars, color: tierColor, size: 60),
              const SizedBox(height: 15),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Total Skor Anda: $skorAkhir',
                style: const TextStyle(fontSize: 16, color: Colors.white70),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Divider(color: Colors.white24),
              ),
              const Text(
                'Anda Membuka Frame Profil:',
                style: TextStyle(color: Colors.white60, fontSize: 14),
              ),
              const SizedBox(height: 5),
              Text(
                tierName,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: tierColor,
                  letterSpacing: 2,
                  shadows: [
                    BoxShadow(
                      color: tierColor.withOpacity(0.5),
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '($tierDesc)',
                style: TextStyle(
                  color: tierColor.withOpacity(0.8),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: tierColor,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  isGameOver = false;
                  isBroken = false;
                  timeLeft = selectedDuration;
                  totalSum = 0;
                  timeElapsed = 0.0;
                });
              },
              child: const Text(
                'Klaim & Selesai',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  bool checkPrime(int number) {
    if (number <= 1) return false;
    for (int i = 2; i <= sqrt(number); i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  void stopGameLogic() {
    _physicsTimer?.cancel();
    _gyroSub?.cancel();
    _accelSub?.cancel();
    _walkAnimationController.stop();
  }

  @override
  void dispose() {
    stopGameLogic();
    _walkAnimationController.dispose();
    super.dispose();
  }

  String formatDurationText(int seconds) {
    if (seconds < 60) return '$seconds Detik';
    return '${seconds ~/ 60} Menit';
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double plankWidth = screenWidth * 0.7;
    double characterCenterY = screenHeight * 0.50;
    double feetY = characterCenterY + 115;

    return Scaffold(
      appBar: AppBar(title: const Text('The Fragile Delivery')),
      body: Stack(
        children: [
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _walkAnimationController,
              builder: (context, child) {
                return CustomPaint(
                  painter: PerspectiveRoadPainter(
                    timeElapsed: timeElapsed,
                    selectedDuration: selectedDuration,
                    feetY: feetY,
                  ),
                );
              },
            ),
          ),

          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 30,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white24),
                ),
                child: Column(
                  children: [
                    Text(
                      'Sisa Jarak: $timeLeft s',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: timeLeft <= 5 && isPlaying
                            ? Colors.amberAccent
                            : Colors.white,
                      ),
                    ),
                    Text(
                      'Total Skor: $totalSum',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.greenAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            top: characterCenterY - 125,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 250,
              width: screenWidth,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    bottom: 10,
                    child: AnimatedBuilder(
                      animation: _walkAnimationController,
                      builder: (context, child) {
                        double bobbingY = _walkAnimationController.value * 8;
                        double rockingAngle =
                            (_walkAnimationController.value - 0.5) * 0.1;

                        return Transform.translate(
                          offset: Offset(0, -bobbingY),
                          child: Transform.rotate(
                            angle: rockingAngle,
                            child: CustomPaint(
                              size: const Size(80, 120),
                              painter: StickmanCarrierPainter(
                                isPlaying
                                    ? _walkAnimationController.value
                                    : 0.5,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  Positioned(
                    bottom: 125,
                    child: AnimatedBuilder(
                      animation: _walkAnimationController,
                      builder: (context, child) {
                        double bobbingY = _walkAnimationController.value * 8;
                        return Transform.translate(
                          offset: Offset(0, -bobbingY),
                          child: child,
                        );
                      },
                      child: Transform.rotate(
                        angle: plankAngle,
                        child: SizedBox(
                          width: plankWidth,
                          height: 80,
                          child: Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: plankWidth,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: Colors.orange[400],
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black45,
                                      blurRadius: 5,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment(boxX, -1.0),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 22.0),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: isBroken
                                          ? Colors.red[900]
                                          : Colors.grey[800],
                                      border: Border.all(
                                        color: isBroken
                                            ? Colors.redAccent
                                            : Colors.amber,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black45,
                                          blurRadius: 4,
                                          offset: Offset(2, 4),
                                        ),
                                      ],
                                    ),
                                    child: Icon(
                                      isBroken
                                          ? Icons.broken_image
                                          : Icons.camera_alt,
                                      color: isBroken
                                          ? Colors.redAccent
                                          : Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          if (!isPlaying && !isGameOver)
            Positioned(
              bottom: 40,
              left: 20,
              right: 20,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Pilih Jarak Tempuh:',
                      style: TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<int>(
                          value: selectedDuration,
                          dropdownColor: Colors.grey[900],
                          icon: const Icon(
                            Icons.timer,
                            color: Colors.blueAccent,
                          ),
                          items: durationLevels.map((int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text(
                                formatDurationText(value),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (int? newValue) {
                            if (newValue != null) {
                              setState(() {
                                selectedDuration = newValue;
                                timeLeft = newValue;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: startGame,
                      icon: const Icon(Icons.directions_run),
                      label: const Text(
                        'Mulai Perjalanan',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
