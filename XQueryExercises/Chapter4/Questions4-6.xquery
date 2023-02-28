xquery version "3.1";

declare context item := document {
<persName>
<forname>Claire</forname>
<surname>Zak</surname>
</persName>
};

/persName/surname/fn:string-length(.)

/persName/fn:replace("Claire Zak", "a", "*")

/persName/fn:contains(., "a")
