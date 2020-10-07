import 'package:first_flutter_app/model/movie.dart';
import 'package:flutter/material.dart';

class MovieDetailsThumbnails extends StatelessWidget {
  final String thumbnail;

  const MovieDetailsThumbnails({Key key, this.thumbnail}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,//this will give reponsive width to img
              height: 190,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(thumbnail),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Icon(Icons.play_circle_outline,size: 100,color: Colors.white,),
          ],
        ),
        //how to add linear gradient
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color(0x00f5f5f5),Color(0xfff5f5f5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),

          ),
          height: 70,
        ),
      ],
    );
  }
}
class MovieDEtailsHeaderWithPoster extends StatelessWidget {
  final Movie movie;

  const MovieDEtailsHeaderWithPoster({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          MoviePoster(poster:movie.Images[0].toString()),
          SizedBox(width: 20,),
          Expanded(child: MovieDEtailsHeader(movie: movie,))
        ],
      ),
    );
  }
}


class MoviePoster extends StatelessWidget {
  final String poster;

  const MoviePoster({Key key, this.poster}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var borderRadius=BorderRadius.all(Radius.circular(10.0));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width /3,
          height: 160,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image:NetworkImage(poster),fit: BoxFit.cover )
          ),
        ),
      ),
    );
  }
}

class MovieDEtailsHeader extends StatelessWidget {
  final Movie movie;

  const MovieDEtailsHeader({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Text("${movie.Year} . ${movie.Genre}".toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: Colors.blueAccent.shade400,
          ),
        ),
        Text(movie.Title,style: TextStyle(
            fontSize: 34.0,
            fontWeight:FontWeight.bold
        ),),
//using rich we can add 10 lines of text
        Text.rich(TextSpan(style: TextStyle(
          fontSize: 16,fontWeight:FontWeight.w300,
        ),
            children: <TextSpan>[
              TextSpan(
                  text: movie.Plot
              ),
              TextSpan(
                  text: "more...",
                  style: TextStyle(
                    color: Colors.indigoAccent,
                    fontWeight: FontWeight.bold,
                  )
              )
            ]
        ))
      ],

    );
  }
}

class MovieDetailsCast extends StatelessWidget {
  final Movie movie;

  const MovieDetailsCast({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          MovieField(field:"Cast",value:movie.Actors),
          MovieField(field:"Directors",value:movie.Director),
          MovieField(field:"Awards",value:movie.Awards),
        ],
      ),
    );
  }
}

class MovieField extends StatelessWidget {
  final String field;
  final String value;

  const MovieField({Key key, this.field, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("$field:",style: TextStyle(
            color: Colors.indigo,
            fontSize: 12,
            fontWeight: FontWeight.w300

        ),),
        Expanded(
          child: Text(value,style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w300
          ),),
        )
      ],
    );
  }
}

class HorizontalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12.0),
      child: Container(
        height: 0.5,
        color: Colors.grey,
      ),
    );
  }
}

class MovieDetailsExtraPosters extends StatelessWidget {
  final List<String> posters;

  const MovieDetailsExtraPosters({Key key, this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Center(
            child: Text("More Movie Posters".toUpperCase(),
              style: TextStyle(
                fontSize: 15,

                color: Colors.black26,
              ),),
          ),
        ),
        Container(
          height: 170,
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,

            separatorBuilder: (context,index) => SizedBox(width: 8,),
            itemCount: posters.length,
            itemBuilder: (context,index) => ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width/4,
                height: 160,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(posters[index]),
                        fit: BoxFit.cover)
                ),
              ),
            ),),

        )
      ],
    );
  }
}

