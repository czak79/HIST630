xquery version "3.1";

declare function local: repeat-word ($phrase as xs:string?) as xs:boolean
{
let $all-words-as-token := fn:tokenize($phrase)
let $first-word := $all-words-as-token[1]
let $second-word := $all-words-as-token[2]
return 
if (fn:empty($first-word)) then true()
(:if there is a repeat word then it returns true:) 
else if ($first-word ne $second-word) then false()
(:all words are unique and there is no repetition it returns false:) 
