import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  final String livreurName;

  const MessageScreen({
    Key? key,
    required this.livreurName,
  }) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];
  bool _isTyping = false;
  bool _isOnline = true;

  @override
  void initState() {
    super.initState();
    // Ajouter des messages de démonstration
    _messages.add(
      ChatMessage(
        sender: 'livreur',
        text:
            'Bonjour à Monsieur, c\'est bien le livreur ? Est-ce que vous êtes en route ?',
        time: '11:50',
      ),
    );
    _messages.add(
      ChatMessage(
        sender: 'client',
        text: 'Oui bonjour Monsieur, je suis en route.',
        time: '11:51',
      ),
    );
    _messages.add(
      ChatMessage(
        sender: 'client',
        text: 'J\'aimerais savoir si vous êtes toujours à l\'endroit indiqué ?',
        time: '11:51',
      ),
    );
    _messages.add(
      ChatMessage(
        sender: 'livreur',
        text:
            'Oui oui j\'y suis actuellement, je vous prie de suivre la Map, vous me trouverez sur place.',
        time: '11:52',
      ),
    );

    // Simuler le livreur en train d'écrire après 3 secondes
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isTyping = true;
        });

        // Arrêter la simulation de frappe après 2 secondes
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            setState(() {
              _isTyping = false;
            });
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.deepOrange,
              child: Text(
                widget.livreurName.substring(0, 1),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.livreurName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                Text(
                  _isTyping
                      ? 'En train d\'écrire...'
                      : (_isOnline ? 'En ligne' : 'Hors ligne'),
                  style: TextStyle(
                    color: _isTyping
                        ? Colors.blue
                        : (_isOnline ? Colors.green : Colors.grey),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam, color: Colors.red),
            onPressed: () {
              // Initialiser un appel vidéo (fonctionnalité à implémenter)
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content:
                        Text('Fonctionnalité d\'appel vidéo en développement')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.call, color: Colors.deepOrange),
            onPressed: () {
              // Revenir à l'écran précédent et ouvrir l'écran d'appel
              Navigator.pop(context);
              // Vous pouvez ajouter un callback ici pour ouvrir l'écran d'appel
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: false,
              padding: const EdgeInsets.all(10),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessage(_messages[index]);
              },
            ),
          ),
          if (_isTyping)
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 5.0),
                child: Text(
                  "En train d'écrire...",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, -3),
                  blurRadius: 6.0,
                  color: Colors.black.withOpacity(0.1),
                )
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        hintText: "Écrire un message",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                      ),
                      onChanged: (text) {
                        // Vous pouvez ajouter une logique ici pour indiquer à l'autre utilisateur que vous êtes en train d'écrire
                      },
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.emoji_emotions_outlined),
                  color: Colors.grey,
                  onPressed: () {
                    // Ajouter un emoji (fonctionnalité à implémenter)
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  color: Colors.deepOrange,
                  onPressed: () {
                    if (_messageController.text.trim().isNotEmpty) {
                      final now = DateTime.now();
                      final formattedTime =
                          "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";

                      setState(() {
                        _messages.add(
                          ChatMessage(
                            sender: 'client',
                            text: _messageController.text.trim(),
                            time: formattedTime,
                          ),
                        );
                        _messageController.clear();
                      });

                      // Simuler une réponse du livreur après 2 secondes
                      Future.delayed(const Duration(seconds: 2), () {
                        if (mounted) {
                          setState(() {
                            _isTyping = true;
                          });

                          Future.delayed(const Duration(seconds: 2), () {
                            if (mounted) {
                              final now = DateTime.now();
                              final formattedTime =
                                  "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";

                              setState(() {
                                _isTyping = false;
                                _messages.add(
                                  ChatMessage(
                                    sender: 'livreur',
                                    text:
                                        'D\'accord, je vous attends. N\'hésitez pas si vous avez besoin d\'indications supplémentaires.',
                                    time: formattedTime,
                                  ),
                                );
                              });
                            }
                          });
                        }
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(ChatMessage message) {
    final isMe = message.sender == 'client';

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue[100] : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.text,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              message.time,
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage {
  final String sender;
  final String text;
  final String time;

  ChatMessage({
    required this.sender,
    required this.text,
    required this.time,
  });
}
