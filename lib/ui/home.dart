
import 'package:first_flutter_app/model/movie.dart';
import 'package:first_flutter_app/model/question.dart';
import 'package:first_flutter_app/util/hexcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'movie_ui/movie_ui.dart';

//9.ListViews= is another widget that allow us to crete rows in a list and
// we can sort of data into the listview
//listview is very neat and well user interface component becoz
// it let us put a lot of data scrawl about data in
// such a small screen on mobile devices
//in flatter ,page in screens are called routes.
// it is based on different route
class MovieListView extends StatelessWidget {

  final List<Movie> movieList =Movie.getMovies();

  final List movies=[
    "Titanic","Blade Runner","Rambo","The Avengers",
    "Avatar",
    "I am Legend",
    "300",
    "The Wolf of Wall Street",
    "Interstellar","Game of Thrones","Vikings","Vikings","Vikings"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
          itemCount: movieList.length,//controller of listview
          itemBuilder: (BuildContext context,int index){

            return Stack(children:<Widget>[

              movieCard(movieList[index], context),
              Positioned(
top: 11.0,
                  child: movieImage(movieList[index].Images[0]))
            ]);
        /*return Card(
          elevation:5.5 ,//it gives shadow to card i.e higher elevation the more shadow around it
          color: Colors.white,
          child: ListTile(
            leading: CircleAvatar( //A widget to display before the title.
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                 // color: Colors.blue,
                  image: DecorationImage(
                    image: NetworkImage(movieList[index].Images[0]),
                    fit: BoxFit.cover
                  ),
                      borderRadius: BorderRadius.circular(13.9)
                ),
                *//*child: Text("M"),*//*

              ),
            ),
            trailing: Text("..."),//A widget to display after the title.
            title: Text(movieList[index].Title),
            subtitle: Text("${movieList[index].Language}"),
onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>MoviesListViewsDetails(
                    movieName:movieList.elementAt(index).Title,
                  movie: movieList[index],
                  )));
},
//onTap: () => debugPrint("Movie name: ${movies.elementAt(index)}"),
          ),
        );*/
      }),
    );
  }
  Widget movieCard(Movie movie ,BuildContext context){
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,
            left: 54.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible( // if title is too long it wrap with new line
                        child: Text(movie.Title,style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0
                            ,color: Colors.white,
                        ),),
                      ),
                      Text("Rating: ${movie.imdbRating} /10",style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey,
                      ),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text("Relaesed: ${movie.Released}",style: mainTextstyle()),
                    Text(movie.Runtime,style: mainTextstyle()),
                    Text(movie.Rated,style:mainTextstyle()),
                  ],
)
                ],
              ),
            ),
          ),
        ),
      ),

      onTap: () => {
      Navigator.push(context, MaterialPageRoute(
      builder: (context) =>MoviesListViewsDetails(
      movieName:movie.Title,
      movie: movie,
      ))),
      },
    );
  }
  TextStyle mainTextstyle(){
    return TextStyle(

        fontSize: 15.0,
        color: Colors.grey,

    );
  }

  Widget movieImage(String imageurl){
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image:NetworkImage(imageurl ?? 'https://picsum.photos/200/300?grayscale')
        ,fit: BoxFit.cover)
      ),
    );
  }
}

//new route (screen or page)
class MoviesListViewsDetails extends StatelessWidget {
  final String movieName;
final Movie movie;
  const MoviesListViewsDetails({Key key, this.movieName, this.movie}) : super(key: key);
  /*A Key is an identifier for Widgets, Elements and SemanticsNodes.
  A new widget will only be used to update an existing element
   if its key is the same as the key of the current widget associated with the element.*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: ListView(
        children: <Widget>[
      MovieDetailsThumbnails(thumbnail: movie.Images[0],),
          MovieDEtailsHeaderWithPoster(movie: movie),
          HorizontalLine(),
          MovieDetailsCast(movie: movie),
          HorizontalLine(),
          MovieDetailsExtraPosters(posters: movie.Images)
        ],
      ),

      /*body: Container(
        child: Center(
          child: RaisedButton(
              child: Text("Go back  ${this.movie.Director}"),
              onPressed: (){
Navigator.pop(context);
              }),
        ),
      ),*/
    );
  }
}

 
 
 
 
 
//here all the application based on single routes
//5.stateful widget like textfields,slider,=it save internal state,widget redrawing happening.
//every stateful widget have state object which all it does is to store state objects.

//8.quiz application
class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  int _currentquesindex = 0;

  List quesbank = [
    Question.name(
        "Only character or integer can be used in switch statement", false),
    Question.name("The return type of malloc function is void.", false),
    Question.name("#define is known as preprocessor compiler directive.", true),
    Question.name("Algorithm is the graphical representation of logic", true),
    Question.name(
        "sizeof( ) is a function that returns the size of a variable.", false),
    Question.name(
        "It is necessary that a loop counter must only be an int. It cannot be a float.",
        false),
    Question.name(
        "A zero value is considered to be false and a non-zero value is considered to be true",
        true),
    Question.name("Algorithm is the graphical representation of logic", true),
    Question.name(
        "sizeof( ) is a function that returns the size of a variable.", false),
    Question.name(
        "It is necessary that a loop counter must only be an int. It cannot be a float.",
        false),
    Question.name(
        "A zero value is considered to be false and a non-zero value is considered to be true",
        true)
  ];

  @override
  Widget build(BuildContext context) {
    //Buildcontext is an obj. that knows all about the structure of our UI where things are placed
    //thts why we need to pass it whenever we want to construct something a little bit more complex into our ui.
    return Scaffold(
      appBar: AppBar(
        title: Text("True citizen"),
        centerTitle: true,
        //backgroundColor: Colors.blueGrey,
      ),
      //backgroundColor: Colors.blueGrey,
      body: Builder( //we can pass builder here for snakbar
        //we use builder here to use a [context] that is a descendent of [Scaffold]
        //or else [Scaffold.of will return null]
        builder:(BuildContext context ) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Center(
                    child: Image.asset("images/i1.jpg", width: 280, height: 180)),

              ),
              Padding(
                padding: const EdgeInsets.all(14.4),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14.0),
                      border: Border.all(
                          color: Colors.blueGrey.shade400,
                          style: BorderStyle.solid
                      )
                  ),
                  height: 120.0,
                  margin: EdgeInsets.only(top: 30.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(quesbank[_currentquesindex].questionText,
                        /*style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.white
                        ),*/),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(onPressed: () => _previousques(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(Icons.arrow_back, color: Colors.white,),
                  ),
                  RaisedButton(onPressed: () => _checkAnswer(true,context),
                    color: Colors.blueGrey.shade900,
                    child: Text("true", style: TextStyle(color: Colors.white)),
                  ),
                  RaisedButton(onPressed: () => _checkAnswer(false,context),
                    color: Colors.blueGrey.shade900,
                    child: Text("false", style: TextStyle(color: Colors.white),),
                  ),
                  RaisedButton(onPressed: () => _nextQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(Icons.arrow_forward, color: Colors.white,),
                  )
                ],
              ),
              Spacer() //put image at top
            ],
          ),
        ),
      ),
    );
  }

  _checkAnswer(bool userchoice,BuildContext context) {
    if (userchoice == quesbank[_currentquesindex].isCorrect) {

      final snackbar=SnackBar(
        backgroundColor: Colors.green,
         duration: Duration(milliseconds: 500),
          content: Text("correct"));
      Scaffold.of(context).showSnackBar(snackbar);
      //correct answer
      /*debugPrint("correct");*/
      /*setState(() { // for automatically reload question trick
        _currentquesindex=(_currentquesindex+1)% quesbank.length;
      });*/
      //we can call for this method updatequestion
      _updatequestion();
    }
    else {

      final snackbar=SnackBar(
        backgroundColor: Colors.red,
          duration: Duration(milliseconds: 500),
          content: Text("incorrect"));
      Scaffold.of(context).showSnackBar(snackbar);
     /* debugPrint("incorrect");*/
      /*setState(() { // for automatically reload question trick
        _currentquesindex=(_currentquesindex+1)% quesbank.length;
      });*/
      _updatequestion();
    }
  }
_updatequestion(){
  setState(() {
    _currentquesindex = (_currentquesindex + 1) % quesbank.length;
  });
}
  _nextQuestion() {
    _updatequestion();
  }
_previousques(){
  setState(() {
    _currentquesindex = (_currentquesindex - 1) % quesbank.length;
    debugPrint("Index:$_currentquesindex");
  });
}
}






//7.Tip calculator app
class Billsplitter extends StatefulWidget {
  @override
  _BillsplitterState createState() => _BillsplitterState();
}

class _BillsplitterState extends State<Billsplitter> {

  int _tipPercentage=0;
  int _personcounter=1;
  double _billAmount=0.0;
  Color _purple = HexColor("#6908D6");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //using mediaquery we can application make reponsive on every device
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .2),
        alignment: Alignment.center,
        color:Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color:_purple.withOpacity(0.1),    //Colors.purpleAccent.shade100,
                borderRadius: BorderRadius.circular(12.0)
              ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Total Per Person",style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15.0,
                        color: _purple
                      )),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("\$ ${(calculateTotalPerPerson(_billAmount,
                            _personcounter,_tipPercentage)).toStringAsFixed(2)}",style: TextStyle(
                          fontSize: 34.0,
                          color: _purple
                        ),),
                      ) //using \ this we can use dollar sign in text only
                    ],
                  ),
                ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.blueGrey.shade100,
                  style: BorderStyle.solid
                ),
                borderRadius: BorderRadius.circular(12.0)
                  
              ),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),// for keyboard showing on app
                    style: TextStyle(color: _purple),
                    decoration: InputDecoration(
                      prefixText: "Bill Amount",// just like placholder
                      prefixIcon: Icon(Icons.attach_money) //adding dollar icon in textfield
                    ),
                    onChanged: (String value){
                      try{
                        _billAmount=double.parse(value);


                      }catch(exception){
                        _billAmount=0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("split",style: TextStyle(
                        color: Colors.grey.shade700
                      ),
                      ),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: (){
                              setState(() {
                                if(_personcounter>1){
                                  _personcounter--;
                                }
                                else{

                                }
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: _purple.withOpacity(.1)
                              ),
                              child: Center(
                                child: Text(
                                  "-",style: TextStyle(
                                  color: _purple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0
                                ),
                                ),
                              ),
                            ),
                          ),
                          Text("$_personcounter",style: TextStyle(
                            color: _purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0
                          ),),
                          InkWell(
                            onTap: (){
                              setState(() {

                                  _personcounter++;

                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: _purple.withOpacity(.1)
                              ),
                              child: Center(
                                child: Text(
                                  "+",style: TextStyle(
                                    color: _purple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0
                                ),
                                ),
                              ),
                            ),
                          ),


                        ],
                      )
                    ],
                  ),
                  //tip
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Tip",style: TextStyle(
                        color: Colors.grey.shade700,

                      ),),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(" \$ ${ (calculateTotalTip(_billAmount,
                            _personcounter,_tipPercentage)) }",style: TextStyle(
                          color: _purple,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0
                        ),),
                      )
                    ],
                  ),
                  
                  //how to add slider
                  Column(
                    children: <Widget>[
                      Text("$_tipPercentage%",style: TextStyle(
                        color: _purple,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold
                      ),),
                      //slider here
                      Slider(
                          min: 0,
                          max: 100,
                          activeColor: _purple,
                          inactiveColor: Colors.grey,
                          //how to add divisions in slider
                          divisions: 10,
                          value:_tipPercentage.toDouble(),
                          onChanged:(double value){
                        setState(() {
                          _tipPercentage=value.round();
                        });
                      })


                    ],
                  )
                ],
              ),
            )
            
          ],
        ),
      )
    );
  }
  calculateTotalPerPerson(double billAmount,int splitBy,int tippercentage){
    //totalTip=calculateTotalTip(billAmount, splitBy,tippercentage)
var totalperperson=(calculateTotalTip(billAmount, splitBy,tippercentage) +billAmount)/splitBy;
return totalperperson;
  }
  calculateTotalTip(double billAmount,int splitBy,int tippercentage){
    double totalTip=0.0;
    if(billAmount<0 || billAmount.toString().isEmpty || billAmount==null){
      //no go
    }
    else{
      totalTip=(billAmount*tippercentage)/100;
    }
    return totalTip;
  }
}
//here end tip calculator




//6.it change the UI(redraw the widget)(Quotes appliaction)
class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {

  int _index=0;
  List Quote=[
    "Your time is limited, so don’t waste it living someone else’s life. Don’t be trapped by dogma ",
    "Money and success don’t change people; they merely amplify what is already there.",
    "Never let the fear of striking out keep you from playing the game",
    "If you want to live a happy life, tie it to a goal, not to people or things.",
    "Not how long, but how well you have lived is the main thing."
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                    width: 350,
                height: 200,
                    margin: EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14.5)
                    ),
                    child: Center(child: Text(Quote[_index % Quote.length],style: TextStyle(
                      color: Colors.grey.shade600,
                      fontStyle: FontStyle.italic,
                      fontSize: 16.5
                    ),))),
              ),
            ),
            Divider(thickness: 1.3,),
            Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: FlatButton.icon(
                  onPressed: _showQuote,
                  color: Colors.greenAccent.shade700,
                  icon: Icon(Icons.wb_cloudy),
                  label: Text("Inspired me",style: TextStyle(color: Colors.white,fontSize: 18),)),
            ),
            Spacer()
          ],

        ),
      ),
    );
  }

  _showQuote() {
//how to set state
  setState(() {
    //increment our index counter by 1
    _index+=1;
  });

  }

}

//here end quote application-----//



//stateless widgets= no internal state,no widget redrawing like button,text
//4.Bizcard application
class BizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bizcard"),
        
      ),
      backgroundColor: Colors.grey,
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            _getCard(),
            _getAvatar()
          ],
        ),
      ),
    );
  }

  Container _getCard() {
    return Container(
      width: 600,
      height: 300,
      margin: EdgeInsets.all(60.0),
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(14.5)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("sheetal verma",style: TextStyle(fontSize: 22.9,fontWeight: FontWeight.bold,
          color: Colors.white),),

          Text("this is my business application",style: TextStyle(fontSize: 20.9,
              fontWeight: FontWeight.w300,
              color: Colors.white),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.person_outline),
              Text("T:vermasheetal581@gmail.com",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,
                  color: Colors.white),)
            ],
          )
        ],
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        border: Border.all(color: Colors.redAccent,width: 1.2),
        image:DecorationImage(image: NetworkImage("https://picsum.photos/id/237/300/300"),fit: BoxFit.cover)
      ),
    );
  }
}

/////here end -----bizcard application ---------////


//3.In this class we create bottomnavaigationbar,floating call missed button,and calling custom button using Scaffold
class ScaffoldExample extends StatelessWidget {

  _tapButton(){
    debugPrint("tapped button");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent.shade700,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.email), onPressed: () =>debugPrint("email tapped!")),
          IconButton(icon: Icon(Icons.access_alarm), onPressed: _tapButton)
        ],
      ),

      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightGreen,
          child: Icon(Icons.call_missed),
          onPressed: () =>debugPrint("hello")),

      bottomNavigationBar:BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.account_box),title: Text("first")),
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit),title: Text("second")),
        BottomNavigationBarItem(icon: Icon(Icons.email),title: Text("third")),
      ],
      onTap: (int index) => debugPrint("Tapped item:$index"),
      ),
      backgroundColor:Colors.redAccent.shade100,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
CustomButton()
          /*InkWell(
            child: Text("Tap me!",
            style: TextStyle(fontSize: 23.4),
            ),
            onTap: () =>debugPrint("tapped!"),


        )*/

        ],
        ),
      ),
    );
  }
}



//2.how to crete a custom button using Gesture detector
class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        final snackBar=SnackBar(content: Text("hello again"),
        backgroundColor: Colors.amberAccent.shade200,);
        Scaffold.of(context).showSnackBar(snackBar);
      },

      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.pinkAccent,
          borderRadius: BorderRadius.circular(8.0)
        ),
        child: Text("Button"),
      ),
    );
  }
}




//1.material designing
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.orange,

      child: Center(child: Text("Hello flutter!",textDirection: TextDirection.ltr,
        style: TextStyle(
            fontSize: 28.4,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic
        ),
      )),
    );

    /* return Center(
      child: Text("hello flutter!",
        textDirection: TextDirection.ltr,),
    );*/
  }
}