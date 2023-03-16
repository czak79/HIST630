xquery version "3.1";

(: Question 3:)
(:fn:substring("Digital Humanities", 9):)
(:fn:substring ("Digital Humanities", 9, 10):)

(:Question 4:)

(:fn:head(("Shinpei Goto", "Gentarō Kodama", "Kenjirō Den")):)
(:fn:tail(("Shinpei Goto", "Gentarō Kodama", "Kenjirō Den")):)

(:Question 5:)
declare function local:construct-engligh-list("Shinpei Goto, ", "Gentarō Kodama, ", ", and " "Kenjirō Den")
