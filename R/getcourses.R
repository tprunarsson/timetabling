require(rjson)
Ugla.Url <- paste0("https://ugla.hi.is/service/proftafla/?request=activeProftafla")
Ugla.Data <- readLines(Ugla.Url,  warn = "F")
Ugla.Raw <- fromJSON(Ugla.Data)
Proftafla_id <- Ugla.Raw$data$proftafla_id

Ugla.Url <- paste0("https://ugla.hi.is/service/proftafla/?request=getFile&file=coursesMessy&proftaflaID=", Proftafla_id)
Ugla.course <- readLines(Ugla.Url,  warn = "F")
cat("", file="courses.dat",sep="\n")
for (i in c(1:length(Ugla.course))) {
  cat(Ugla.course[[i]], file="courses.dat",append=TRUE)
  cat(c("\n"), file="courses.dat", append=TRUE)
}

cat("", file="namskeid.txt",sep="")
for (i in c(2:length(Ugla.course))) {
  if (Ugla.course[[i]] == ';') {
    break;
  }
  cat(Ugla.course[[i]], file="namskeid.txt",append=TRUE)
  cat(c("\n"), file="namskeid.txt", append=TRUE)  
}
