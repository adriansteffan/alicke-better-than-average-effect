# Analysis script Better than average effect mark alicke

library(dplyr)
data <- read.csv("data.csv",fileEncoding="utf-16")


# A001_01 - A001_20: positive traits average group
# A001_21 - A001_40: negative traits average group
# A002_01 - A002_20: positive traits paired group
# A002_21 - A002_40: negative traits paired group
#
# A101_01 - A101_18: positive life events average group
# A101_19 - A101_39: negative life events average group
# A102_01 - A102_18: positive life events paired group
# A102_19 - A102_39: negative life events paired group
#
# events scale: 0 .. 4 .. 8
# traits scale: 0 .. 4 .. 8


build_string <- function(task, num) {
  paste("A",task, "_", sprintf("%02d", num), sep="")
}

positive_traits_avg <- 1:20 %>% sapply(function(x){build_string("001", x)})
negative_traits_avg <- 21:40 %>% sapply(function(x){build_string("001", x)})
positive_traits_pair <- 1:20 %>% sapply(function(x){build_string("002", x)})
negative_traits_pair <- 21:40 %>% sapply(function(x){build_string("002", x)})

positive_events_avg <- 1:18 %>% sapply(function(x){build_string("101", x)})
negative_events_avg <- 19:39 %>% sapply(function(x){build_string("101", x)})
positive_events_pair <- 1:18 %>% sapply(function(x){build_string("102", x)})
negative_events_pair <- 19:39 %>% sapply(function(x){build_string("102", x)})


negative_items <- c(negative_traits_avg, negative_traits_pair, negative_events_avg, negative_events_pair)

pair_items <- c(positive_traits_pair, negative_traits_pair, positive_events_pair, negative_events_pair)
avg_items <- c(positive_traits_avg, negative_traits_avg, positive_events_avg, negative_events_avg)

number <- c(
  positive_traits_avg, 
  negative_traits_avg, 
  positive_traits_pair, 
  negative_traits_pair,
  positive_events_avg, 
  negative_events_avg, 
  positive_events_pair, 
  negative_events_pair
)

relevant_data <- data[, number]

data_mutated <- relevant_data %>% 
  mutate_at(.vars=number,.funs = funs(. - 5)) %>% 
  mutate_at(.vars=negative_items,.funs = funs(. * (-1)))

pair_data <- data_mutated[ ,pair_items]
avg_data <- data_mutated[ ,avg_items]

pair <- colMeans(pair_data, na.rm=TRUE)
avg <- colMeans(avg_data, na.rm=TRUE)


positive_events_en = c( 
  "Like postgraduation job",
  "Owning your own home",
  "Starting salary > $10,000",
  "Traveling to Europe",
   "Starting salary > $15,000",
   "Good job offer before graduation",
   "Graduating in top third of class",
   "Home doubles in value in 5 years",
   "Your work recognized with award",
   "Living past 80",
   "Your achievements in newspaper",
   "No night in hospital for 5 years",
   "Having a mentally gifted child",
   "Statewide recognition in your profession",
   "Weight constant for 10 years",
   "In 10 years, earning > $40,000 a year",
   "Not ill all winter",
   "Marrying someone wealthy"
)


negative_events_en = c(
   "Having a drinking problem",
   "Divorced a few years after married",
   "Heart attack before age 40",
   "Contracting venereal disease",
   "Being fired from a job",
   "Being sterile",
   "Dropping out of college",
   "Having a heart attack",
   "Not finding a job for 6 months",
   "Decayed tooth extracted",
   "Having gum problems",
   "Having to take unattractive job",
   "Car turns out to be a lemon",
   "Deciding you chose wrong career",
   "Tripping and breaking bone",
   "Being sued by someone",
   "Having your car stolen",
   "Victim of mugging",
   "In bed ill two or more days",
   "Victim of burglary",
   "Injured in auto accident"
)

positive_traits_en = c(
  "Dependable",
  "Intelligent",
  "Considerate",
  "Observant",
  "Polite",
  "Clear-headed",
  "Respectful",
  "Level-headed",
  "Resourceful",
  "Bright",
  "Cooperative",
  "Honorable",
  "Reliable",
  "Perceptive",
  "Trustful",
  "Mature",
  "Friendly",
  "Creative",
  "Responsible",
  "Imaginative"
)

negative_traits_en = c(
  "Meddlesome",
  "Insecure",
  "Spiteful",
  "Vain",
  "Complaining",
  "Gullible",
  "Deceptive",
  "Belligerent",
  "Disobedient",
  "Humorless",
  "Uncivil",
  "Unpleasant",
  "Snobbish",
  "Lazy",
  "Unstudious",
  "Liar",
  "Disrespectful",
  "Mean",
  "Unforgiving",
  "Maladjusted"
)



positive_events_de = c( 
  "Job nach Studium mögen",
  "Eigenheim besitzen",
  "Einstiegsgehalt > 30.000 Euro jährlich",
  "Weltreise machen",
  "Einstiegsgehalt > 45.000 Euro jährlich",
  "Gutes Jobangebot vor Abschluss",
  "Bei Studienabschluss zum besten Drittel des Jahrgangs gehören",
  "Eigenheim verdoppelt sich im Wert innerhalb von 5 Jahren",
  "Deine Arbeit wird mit einem Preis ausgezeichnet",
  "Älter als 80 werden",
  "Deine Erfolge werden in der Zeitung veröffentlicht",
  "Für 5 Jahre keine Übernachtung im Krankenhaus",
  "Ein hochbegabtes Kind haben",
  "Landesweite annerkennung innerhalb des Berufs",
  "10 Jahre lang das Gewicht halten",
  "In 10 Jahren mehr als 100.000 Euro jährlich verdienen",
  "Den ganzen Winter nicht krank sein",
  "Eine wohlhabende Person heiraten"
)


negative_events_de = c(
  "Alkoholismus",
  "Scheidung wenige Jahre nach Hochzeit",
  "Herzinfarkt vor 40",
  "An einer Geschlechtskrankheit erkranken",
  "Gefeuert werden",
  "Unfruchtbar sein",
  "Das Studium abbrechen",
  "Herzinfarkt",
  "6 Monate lang arbeitssuchend sein",
  "Kaputter Zahn gezogen",
  "Zahnfleischprobleme",
  "Gezwungen sein, einen schlechten Job anzunehmen",
  "Auto entpuppt sich als Schrottkarre",
  "Feststellen, den falschen Karriereweg eingeschlagen zu haben",
  "Stolpern und Knochenbruch",
  "Verklagt werden",
  "Auto wird geklaut",
  "Opfer eines Überfalls sein",
  "Für mehr als zwei Tage am Stück krank im Bett liegen",
  "Opfer eines Einbruchs sein",
  "In Autounfall verletzt werden"
)

positive_traits_de = c(
  "Zuverlässig",
  "Intelligent",
  "Rücksichtsvoll",
  "Aufmerksam",
  "Höflich",
  "Klar im Kopf",
  "Respektvoll",
  "Vernünftig",
  "Einfallsreich",
  "Klug",
  "Kooperativ",
  "Ehrenhaft",
  "Verlässlich",
  "Einfühlsam",
  "Vertrauensvoll",
  "Reif",
  "Freundlich",
  "Kreativ",
  "Verantwortungsvoll",
  "Fantasievoll"
)

negative_traits_de = c(
  "Aufdringlich",
  "Unsicher",
  "Boshaft",
  "Eingebildet",
  "Nörgelnd",
  "Leichtgläubig",
  "Trügerisch",
  "Angriffslustig",
  "Ungehorsam",
  "Humorlos",
  "Unhöflich",
  "Unangenehm",
  "Versnobt",
  "Faul",
  "Unwissend",
  "Lügner",
  "Respektlos",
  "Gemein",
  "Nachtragend",
  "Unangepasst"
)

de <- c(positive_traits_de, negative_traits_de, positive_events_de, negative_events_de)
en <- c(positive_traits_en, negative_traits_en, positive_events_en, negative_events_en)

result <- data.frame(de, en, avg, pair)
result$diff <- result$avg - result$pair

result1 <- result[1:40,]
result2 <- result[41:79,]


trait_bta_avg <- nrow(result1[result1$avg>0,])
trait_bta_pair <- nrow(result1[result1$pair>0,])

event_bta_avg <- nrow(result1[result2$avg>0,])
event_bta_pair <- nrow(result1[result2$pair>0,])

trait_avg_mean <- mean(result1$avg)
trait_pair_mean <- mean(result1$pair)
event_avg_mean <- mean(result2$avg)
event_avg_mean <- mean(result2$pair)
