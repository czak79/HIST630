xquery version "3.1";

declare variable $sentence := "When in the course of himan events events";

declare function local:repeat-word ($phrase as xs:string?) as xs:string
{
let $all-words-as-token := fn:lower-case($phrase) => fn:tokenize(" ")
let $first-word := $all-words-as-token[1]
let $second-word := $all-words-as-token[2]
return 
if (fn:empty($second-word)) then "There is no duplicate." (:Could also do a boolean if I wanted. Here, the base case would only be true at the end of the recursion.:)
(:If I used a boolean, there is a repeat word then it returns true:) 
else if ($first-word eq $second-word) then fn:concat("Found a duplicate '", $first-word, "' after word ", $first-word ! position(), " of the phrase.")
(:all words are unique and there is no repetition it returns false:) 
else 
let $new-phrase := fn:string-join($tokens[position() = 2 to last()], " ") 
(:Use last() here because it wouldn't work unless I passed the entire rest of tokens in!:)
return local:repeat-word($new-phrase)

local:repeat-word($sentence)

(:original below: 
declare function local:repeat-word ($phrase as xs:string?) as xs:boolean
{
let $all-words-as-token := fn:tokenize($phrase, " ")
let $first-word := $all-words-as-token[1]
let $second-word := $all-words-as-token[2]
return 
if (fn:empty($first-word)) then true()
(:if there is a repeat word then it returns true:) 
else if ($first-word ne $second-word) then false()
(:all words are unique and there is no repetition it returns false:) 
else :)