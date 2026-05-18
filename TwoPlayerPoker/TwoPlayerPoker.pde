String[] suits = {"Heart", "Diamond", "Club", "Spade"};

String[] ranks = {"2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"};

ArrayList<Card> deck = new ArrayList<Card>();

ArrayList<Card> player1 = new ArrayList<Card>();
ArrayList<Card> player2 = new ArrayList<Card>();

String player1Result = "";
String player2Result = "";

class Card {
  String rank;
  String suit;
  int value;
  
  Card(String r, String s, int v) {
    rank = r;
    suit = s;
    value = v;
  }
}

void createDeck() {
  for (int s = 0; s < 4; s++) {
    for (int r = 0; r < 13; r++) {
      deck.add(new Card(ranks[r], suits[s], r + 2));
    }
  }
}

void drawCards(ArrayList<Card> player) {
  for (int c = 0; c < 5; c++) {
    int x = (int)random(deck.size());
    player.add(deck.get(x));
    deck.remove(x);
  }
}

void drawHand(ArrayList<Card> player, int y) {
  for (int i = 0; i < player.size(); i++) {
    int x = 50 + i * 150;
    
    Card card = player.get(i);
    
    fill(255);
    rect(x, y, 100, 200);
    
    fill(0);
    textSize(20);
    text(card.rank, x + 40, y + 35);
    text(card.suit, x + 10, y + 85);
  }
}

boolean hasOnePair(ArrayList<Card> player) {
  for (int i = 0; i < player.size(); i++) {
    for (int j = i + 1; j < player.size(); j++) {
      if (player.get(i).value == player.get(j).value) {
        return true;
      }
    }
  }
  
  return false;
}


int countPairs(ArrayList<Card> player) {
  int pairs = 0;
  boolean[] checked = new boolean[player.size()];
  
  for (int i = 0; i < player.size(); i++) {
    if (checked[i] == false) {
      int count = 1;
      
      for (int j = i + 1; j < player.size(); j++) {
        if (player.get(i).value == player.get(j).value) {
          count++;
          checked[j] = true;
        }
      }
      
      if (count == 2) {
        pairs++;
      }
    }
  }
  
  return pairs;
}

boolean hasTwoPair(ArrayList<Card> player) {
  if (countPairs(player) == 2) {
    return true;
  } else {
    return false;
  }
}

boolean hasSet(ArrayList<Card> player) {
  for (int i = 0; i < player.size(); i++) {
    int count = 0;
    
    for (int j = 0; j < player.size(); j++) {
      if (player.get(i).value == player.get(j).value) {
        count++;
      }
    }
    
    if (count == 3) {
      return true;
    }
  }
  
  return false;
}

String checkHand(ArrayList<Card> player) {
  if (hasSet(player)) {
    return "Set";
  }
  else if (hasTwoPair(player)) {
    return "Two Pair";
  } 
  else if (hasOnePair(player)) {
    return "One Pair";
  } 
  else {
    return "High Card";
  }
}

void startGame() {
  deck.clear();
  player1.clear();
  player2.clear();
  
  createDeck();
  
  drawCards(player1);
  drawCards(player2);
  
  player1Result = checkHand(player1);
  player2Result = checkHand(player2);
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    startGame();
  }
}

void setup() {
  size(800, 800);
  startGame();
}

void draw() {
  background(255);
  
  fill(0);
  textSize(25);
  text("Player 1", width/2 - 50, 50);
  drawHand(player1, 80);
  
  fill(255,0,0);
  textSize(22);
  text(player1Result, 30, 50);
  
  fill(0);
  textSize(25);
  text("Player 2", width/2 - 50, 320);
  drawHand(player2, 350);
  
  fill(255,0,0);
  textSize(22);
  text(player2Result, 30, 330);
  
  textSize(25);
  fill(0);
  text("Press 'r' to deal new cards", width/2 - 130, 720);
}
