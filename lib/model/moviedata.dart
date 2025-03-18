class MovieData{
  String? title;
  String? director;
  String? writer;
  String? plot;
  List<String?>? images;



  MovieData(this.title,this.director,
      this.writer, this.plot, this.images);

  List<MovieData> getMovies(){
    List<String?>? images1 = [
      "https://images-na.ssl-images-amazon.com/images/M/MV5BMjE3MzA4Nzk3NV5BMl5BanBnXkFtZTgwNjAxMTc1ODE@._V1_SX1777_CR0,0,1777,744_AL_.jpg",
      "https://images-na.ssl-images-amazon.com/images/M/MV5BNDMxMTQzMjQxM15BMl5BanBnXkFtZTgwNzAxMTc1ODE@._V1_SX1777_CR0,0,1777,744_AL_.jpg",
      "https://images-na.ssl-images-amazon.com/images/M/MV5BMTUyNjkxOTk5NV5BMl5BanBnXkFtZTgwODAxMTc1ODE@._V1_SX1777_CR0,0,1777,744_AL_.jpg",
      "https://images-na.ssl-images-amazon.com/images/M/MV5BNjM4MzExNDAyNl5BMl5BanBnXkFtZTgwOTAxMTc1ODE@._V1_SX1777_CR0,0,1777,744_AL_.jpg",
      "https://images-na.ssl-images-amazon.com/images/M/MV5BMjE3NTgxMDcyNV5BMl5BanBnXkFtZTgwMDExMTc1ODE@._V1_SX1777_CR0,0,1777,744_AL_.jpg"
    ];
    List<String?>? images2 = [
      "https://images-na.ssl-images-amazon.com/images/M/MV5BMjM3ODc1ODI5Ml5BMl5BanBnXkFtZTgwODMzMDY3OTE@._V1_.jpg",
      "https://images-na.ssl-images-amazon.com/images/M/MV5BMTgxNTAyNTU0NV5BMl5BanBnXkFtZTgwNzMzMDY3OTE@._V1_.jpg",
      "https://images-na.ssl-images-amazon.com/images/M/MV5BMjE5NDc5NzUwNV5BMl5BanBnXkFtZTgwMDM3MDM2NzE@._V1_.jpg"
    ];
    List<String?>? images3 = [
      "https://images-na.ssl-images-amazon.com/images/M/MV5BNDI3ODYyODY4OV5BMl5BanBnXkFtZTgwNjE5NDMwMDI@._V1_SY1000_SX1500_AL_.jpg",
      "https://images-na.ssl-images-amazon.com/images/M/MV5BMjA5OTExMTIwNF5BMl5BanBnXkFtZTgwMjI5NDMwMDI@._V1_SY1000_SX1500_AL_.jpg",
      "https://images-na.ssl-images-amazon.com/images/M/MV5BMTA3MDY2NjA3MzBeQTJeQWpwZ15BbWU4MDU0MDkzODgx._V1_SX1499_CR0,0,1499,999_AL_.jpg",
      "https://images-na.ssl-images-amazon.com/images/M/MV5BMjM3MzYzNDgzOV5BMl5BanBnXkFtZTgwMjQwOTM4ODE@._V1_SY1000_CR0,0,1498,1000_AL_.jpg",
    ];
    return [
      MovieData("Interstellar","Joss Whedon","Scott Derrickson","Given superstrength and durability by a sabotaged experiment, a wrongly accused man escapes prison to become a superhero",
          images1),
      MovieData("The Wolf of Wall Street", "Robert Downey","Justin Kurzel","When Callum Lynch explores the memories of his ancestor Aguilar and gains the skills of a Master Assassin",
          images2),
      MovieData("The Avengers","Vince Gilligan","Cheo Hodari Coker","The Rebellion makes a risky move to steal the plans to the Death Star, setting up the epic saga to follow.",
          images3),
      MovieData("Happy Feet two","John Edwards","Scott Derrickson","Given superstrength and durability by a sabotaged experiment, a wrongly accused man escapes prison to become a superhero",
          images1),
      MovieData("Assassin's Creed", "Gareth Edwards","Justin Kurzel","When Callum Lynch explores the memories of his ancestor Aguilar and gains the skills of a Master Assassin",
          images2),
      MovieData("Rogue One: A Star Wars Story","Vince Gilligan","Cheo Hodari Coker","The Rebellion makes a risky move to steal the plans to the Death Star, setting up the epic saga to follow.",
          images3),
      MovieData("Interstellar","Joss Whedon","Scott Derrickson","Given superstrength and durability by a sabotaged experiment, a wrongly accused man escapes prison to become a superhero",
          images1),
      MovieData("The Wolf of Wall Street", "Robert Downey","Justin Kurzel","When Callum Lynch explores the memories of his ancestor Aguilar and gains the skills of a Master Assassin",
          images2),
      MovieData("The Avengers","Vince Gilligan","Cheo Hodari Coker","The Rebellion makes a risky move to steal the plans to the Death Star, setting up the epic saga to follow.",
          images3),
      MovieData("Happy Feet two","John Edwards","Scott Derrickson","Given superstrength and durability by a sabotaged experiment, a wrongly accused man escapes prison to become a superhero",
       images1),
      MovieData("Assassin's Creed", "Gareth Edwards","Justin Kurzel","When Callum Lynch explores the memories of his ancestor Aguilar and gains the skills of a Master Assassin",
      images2),
      MovieData("Rogue One: A Star Wars Story","Vince Gilligan","Cheo Hodari Coker","The Rebellion makes a risky move to steal the plans to the Death Star, setting up the epic saga to follow.",
      images3)];

  }

}