import 'package:flutter/material.dart';

class NewGameScreen extends StatefulWidget {
  @override
  _NewGameScreenState createState() => _NewGameScreenState();
}

class _NewGameScreenState extends State<NewGameScreen> {
  List<Player> _availablePlayers = [];
  List<Player> _selectedPlayers = [];

  @override
  void initState() {
    super.initState();
    _availablePlayers = [
      Player(id: 0, name: "Ross", nickname: "Geller", picture: "test"),
      Player(id: 1, name: "Rachel", nickname: "Green", picture: "test"),
      Player(id: 2, name: "Chandler", nickname: "Bing", picture: "test"),
    ];
  }

  _selectPlayer() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Existing players"),
          content: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Positioned(
                right: -40.0,
                top: -40.0,
                child: InkResponse(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CircleAvatar(
                    child: Icon(Icons.close),
                    backgroundColor: Colors.lightBlue,
                  ),
                ),
              ),
              StatefulBuilder(
                builder: (BuildContext context, StateSetter alertState) {
                  return Container(
                    width: 350.0,
                    height: 150.0,
                    child: ListView.builder(
                      itemCount: _availablePlayers.length,
                      itemBuilder: (context, playerIndex) {
                        return CheckboxListTile(
                          title: Text(_availablePlayers[playerIndex].nickname +
                              " " +
                              _availablePlayers[playerIndex].name),
                          value: _selectedPlayers
                              .contains(_availablePlayers[playerIndex]),
                          onChanged: (bool value) {
                            if (_selectedPlayers
                                .contains(_availablePlayers[playerIndex])) {
                              _selectedPlayers
                                  .remove(_availablePlayers[playerIndex]);
                            } else {
                              _selectedPlayers
                                  .add(_availablePlayers[playerIndex]);
                            }
                            setState(() {}); //ALSO UPDATE THE PARENT STATE
                            alertState(() {});
                          },
                          secondary: const Icon(Icons.hourglass_empty),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  _onReorder(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    print('oldIndex:$oldIndex');
    print('newIndex:$newIndex');
    setState(() {
      Player player = _selectedPlayers[newIndex];
      _selectedPlayers[newIndex] = _selectedPlayers[oldIndex];
      _selectedPlayers[oldIndex] = player;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Game")),
      body: Column(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.people),
              title: Text("Choose players"),
              onTap: _selectPlayer,
            ),
          ),
          Flexible(
            child: ReorderableListView(
              onReorder: _onReorder,
              children: _selectedPlayers.map((player) {
                return ListTile(
                  key: ValueKey(player.id),
                  title: Text(player.nickname + " " + player.name),
                  leading: Text("#${_selectedPlayers.indexOf(player) + 1}"),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class Player {
  int id;
  String name;
  String nickname;
  String picture;

  Player({this.id, this.name, this.nickname, this.picture});
}
