xquery version "3.1";

(:Question 1:)

(:declare namespace tei = "http://www.tei-c.org/ns/1.0";:)

(:<tei:title>
    {fn:concat("Harry Potter", ": ", "and the Sorcer's Stone")}
</tei:title>:)

(:declare variable $title := "There And Back Again";
declare variable $subtitle:= " : A Hobbit's Tale";

<tei:title>
    {fn:concat($title, $subtitle)}
</tei:title>:)

(:Question 2:)

(:let $my-name := "Claire Zak"
return fn:concat("Hello", " ", $my-name, "!"):)

(:Question 3:)

(:let $names := ("Abigail", "Alondra", "Claire", "Kristen", "Lindsey", "Margaret", "Patrick", "Regan", "Tristan", "Lauren", "Dan")
for $name in $names
return fn:concat("Hello", " ", $name, "!"):)

(:Question 4:)

(:declare context item := fn:doc("https://raw.githubusercontent.com/dlschwartz/sandbox/master/XQ4HumBooks.xml");:)
(:let $books := books/book
return $books/title:)


(:Supposedly able to put file name or file path or website link but file cannot be an xquery document, must be an xml document:)

(:declare context item := document;

let $books := books/book
return $books/title:)

(:for $book in books/book

where fn:contains ($book/title, "Histor")
where fn:contains($book/date, "2013")

    let $author := $book/author
    let $title := $book/title
    let $press := $book/publisher/press
    let $date := $book/date
return 
    <bibl>
        {fn:concat($author, ". ", $title, ". ", $press, ". ", $date) }
    </bibl>:)

(:for $book in $books/book [fn:contains(title, "Histor")]:) (:this goes on the first line:)

(:for $book in books/book
    let $author := $book/author
    let $title := $book/title
    let $press := $book/publisher/press
    let $date := $book/date
order by $author
return $book:)

(:let $books in books/book
for $book in $books
order by $title
return $book:)

(:let $books in books/book
for $book in $books
order by $date
return $book:)

(:let $books := $books/book
for $book in $books
order by $book/@date ascending 
return $book:)

(:Question 5:)

(:for $book at $n in books/book
    let $author := $book/author
    let $title := $book/title
    let $press := $book/publisher/press
    let $date := $book/date
return 
    <bibl n="{$n}>
        {fn:concat($author, ". ", $title, ". ", $press, ". ", $date) }
    </bibl>:)

(:Question 6:)

(:for $book at $n in books/book
let $year := $book/date/@year
group by $year
order by $year descending
return 
<book published="{$year}"></book>:)

(:order by $book/@date descending, $book/text()
group by $date := $book/@date
return 
    <book published ="{$date}">
        {$book}
        </book>:)
        
(:Question 7:)

(:let $names := ("Abigail", "Alondra", "Claire", "Kristen", "Lindsey", "Margaret", "Patrick", "Regan", "Tristan", "Lauren", "Dan")
for $name in $names
return 
   <greetings>
   {if ($name eq "Claire") then 
        fn:concat("Hola ", $name)
    else
        fn:concat("Hello!", $name) }
   </greetings>:)
        
(:Question 8:)

declare context item := fn:doc("https://raw.githubusercontent.com/dlschwartz/sandbox/master/XQ4HumBooks.xml");
for $book in books/book
    let $type :=
        if (xs:integer($book/date/year) lt 2000) then "old"
        else "new"
    group by $type
return 
    <bucket type="{$type}">
        {$book/title}
    </bucket>
