import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class GlassmorphicMusicPlayer extends StatefulWidget {
  @override
  _GlassmorphicMusicPlayerState createState() => _GlassmorphicMusicPlayerState();
}

class _GlassmorphicMusicPlayerState extends State<GlassmorphicMusicPlayer> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration(minutes: 2, seconds: 20);

  @override
  void initState() {
    super.initState();
    _audioPlayer.setUrl(
        'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3');
    _audioPlayer.durationStream.listen((duration) {
      setState(() {
        _totalDuration = duration ?? Duration.zero;
      });
    });
    _audioPlayer.positionStream.listen((position) {
      setState(() {
        _currentPosition = position;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _togglePlayPause() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Song Title and Artist Name

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Love me like you do",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height:10),
                  Text(
                    "Ellie Goulding",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Icon(Icons.share, color: Colors.white70),
            ],
          ),
          SizedBox(height: 50),
          // Progress Bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatDuration(_currentPosition),
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
              Expanded(
                child: Slider(
                  value: _currentPosition.inSeconds.toDouble(),
                  min: 0,
                  max: _totalDuration.inSeconds.toDouble(),
                  onChanged: (value) {
                    _audioPlayer.seek(Duration(seconds: value.toInt()));
                  },
                  activeColor: Colors.blueAccent,
                  inactiveColor: Colors.white24,
                ),
              ),
              Text(
                _formatDuration(_totalDuration),
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
          SizedBox(height: 10),
          // Control Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.skip_previous, color: Colors.white, size: 32),
              Icon(Icons.fast_rewind, color: Colors.white, size: 32),
              GestureDetector(
                onTap: _togglePlayPause,
                child: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  radius: 28,
                  child: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
              Icon(Icons.fast_forward, color: Colors.white, size: 32),
              Icon(Icons.skip_next, color: Colors.white, size: 32),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    return "${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}";
  }
}
