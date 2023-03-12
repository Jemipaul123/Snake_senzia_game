import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show SilverGridDelegateWithFixedCrossAxisCount;
import 'package:snake_game/blank_pixel.dart';
import 'package:snake_game/food_pixel.dart';
import 'package:snake_game/snake_pixel.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
enum snake_Direction{UP,DOWN,LEFT,RIGHT}

class _HomePageState extends State<HomePage> {
  int rowSize =10;
  int totalNumberofSquares =100;
// user score
  int currentScore =0;

  //snake position
  List<int> snakePos = [0,1,2,];


  //snake direction is initially to the right
  var currentDirection = snake_Direction.RIGHT;
  //food position
  int foodPos=55;
 void submitScore(){}
  // start game
  void startgame(){
    Timer.periodic(Duration(milliseconds: 200),(timer) {
      setState(() {
        moveSnake();
      // check if game is over
        if(gameover()){
          timer.cancel();
          //displaying msg to user
          showDialog(
              context: context,builder: (context){
            return AlertDialog(
              title: Text('Game over'),
              content: Column(
                children: [
                  Text('Your score is: ' + currentScore.toString()),
                  TextField(
                    decoration: InputDecoration(hintText: 'Enter name'),
            ),

                ],
              ),
              actions: [MaterialButton(onPressed: submitScore,
              child:Text('Submit'),
              color:Colors.lime)],
            );
          });
        }

      });
    });

  }
  void eatfood() {
    currentScore++;
    while (snakePos.contains(foodPos)){
      foodPos =Random().nextInt(totalNumberofSquares);
    }
  }



  void moveSnake() {
    switch (currentDirection) {
      case snake_Direction.RIGHT:
        { //head
          
          if (snakePos.last % rowSize == 9) {
            snakePos.add(snakePos.last + 1 - rowSize);
          }
          else {
            snakePos.add(snakePos.last + 1);
          }


        }

        break;
      case snake_Direction.LEFT:
        {
          // head
          if (snakePos.last % rowSize == 0) {
            snakePos.add(snakePos.last - 1 + rowSize);
          }
          else {
            snakePos.add(snakePos.last - 1);
          }



        }

        break;
      case snake_Direction.UP:
        {
          // head
          if (snakePos.last < rowSize) {
            snakePos.add(snakePos.last - rowSize + totalNumberofSquares);
          }
          else {
            snakePos.add(snakePos.last - rowSize);
          }


        }
        break;
      case snake_Direction.DOWN:
        {
          // head
          if (snakePos.last + rowSize > totalNumberofSquares) {
            snakePos.add(snakePos.last + rowSize - totalNumberofSquares);
          }
          else {
            snakePos.add(snakePos.last + rowSize);
          }


        }

        break;

      default:
    }
    // food
    if (snakePos.last == foodPos) {
      eatfood();
    } else {
      //remove a head
      snakePos.removeAt(0);
    }
  }
  //game over
  bool gameover(){
    //the game is over when the snake runs into itself
    List<int> bodySnake =  snakePos.sublist(0,snakePos.length-1);
    if(bodySnake.contains(snakePos.last)){
      return true;
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
              children:[
                Column(
                  children: [

                    Text('Current Score'),
                    //user current score
                    Text(currentScore.toString(),
                    style: TextStyle(fontSize: 36),
                    ),


                    
                    
                  ],
                ),
              ]


            ),
          ),

          //game grid
          Expanded(
            flex: 3,
            child:GestureDetector(
              onVerticalDragUpdate: (details){
                if(details.delta.dy>0 && currentDirection != snake_Direction.UP){
                  currentDirection = snake_Direction.DOWN;
                }
                else if(details.delta.dy<0 && currentDirection != snake_Direction.DOWN)

                  {
                    currentDirection = snake_Direction.UP;
                  }
              },
              onHorizontalDragUpdate: (details){
                if(details.delta.dx>0 && currentDirection != snake_Direction.LEFT){
                  currentDirection = snake_Direction.RIGHT;
                }
                else if(details.delta.dx<0 && currentDirection != snake_Direction.RIGHT)

                {
                  currentDirection = snake_Direction.LEFT;
                }
              },
            child: GridView.builder(
              itemCount:totalNumberofSquares,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:rowSize),
             itemBuilder: (context,index){
                if(snakePos.contains(index)){
                  return const SnakePixel();}
                else if(foodPos== index){
                  return const FoodPixel();

                }
                  else{
                    return const BlankPixel();
                }
              }),
    ),

          ),

          //play button

          Expanded(
            child: Container(
              child: Center(
                  child: MaterialButton(
              child: Text('PLAY'),
                 color: Colors.red,
                    onPressed: startgame,
                 ),
              ),
              
            ),
          ),
        ],
      ),
    );
  }
}
