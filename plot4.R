
Mute1 <- mutate(sourceClassCode, CombCoal=paste(SCC.Level.One, SCC.Level.Three, sep = " "))
Mute2 <- select(Mute1, SCC, CombCoal)