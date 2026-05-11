String[] suits = {"Heart", "Diamond", "Club", "Spade"};

String[] ranks = {"2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"};

ArrayList<Card> deck = new ArrayList<Card>();

Card[] player1 = new Card[5];
Card[] player2 = new Card[5];

class Card{
  String rank; 
  String suit;
  int value;
  
  Card(String r, String s, int v){
    rank = r;
    suit = s;
    value = v;
  }
}

void createDeck(){
  
  for(int s = 0; s < 4 ; s++){
    for(int r = 0; r < 13; r++){
      deck.add(new Card(ranks[r], suits[s], r + 2));
      
    }
  }
}

void drawCards(Card[] player){
  for(int c = 0; c <= 4; c++){
  int x = (int)random(1,52);
  player[0] = deck.get(x);
  deck.remove(x);
}
}
 
void setup() {
  size(500,600);
  createDeck(); 
  
  drawCards(player1);
  drawCards(player2);
}

void draw(){
  background(255);
  
}
