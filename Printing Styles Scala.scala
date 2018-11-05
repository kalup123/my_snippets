  // printf style:
  println(f"Pi is about $piSinglePrecision%.3f")  //> Pi is about 3.142
  println(f"Zero padding on the left: $numberOne%05d")
                                                  //> Zero padding on the left: 00001
                                                  
  // Substituting in variables:
  println(s"I can use the s prefix to use variables like $numberOne $truth $letterA")
                                                  //> I can use the s prefix to use variables like 1 true a
                                                  
                                                  
  // Substituting expressions (with curly brackets):
  println(s"The s prefix isn't limited to variables; I can include any expression. Like ${1+2}")
                                                  //> The s prefix isn't limited to variables; I can include any expression. Like
                                                  //|  3