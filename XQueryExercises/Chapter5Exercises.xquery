xquery version "3.1";

(:Question 1:)

(:declare namespace tei = "http://www.tei-c.org/ns/1.0";

<tei:placeName/>:)

(:Question 2:)

(:let $my-name := "Claire Zak"
return fn:concat("Hello", " ", $my-name, "!"):)

(:Question 3:)

(:let $names := ("Abigail", "Alondra", "Claire", "Kristen", "Lindsey", "Margaret", "Patrick", "Regan", "Tristan", "Lauren", "Dan")
for $name in $names
return fn:concat("Hello", " ", $name, "!"):)

(:Question 4:)

(:declare context item := document {
<books>
<book>
    <title>Primo Levi: The Matter of Life</title>
    <author>Berel Lang</author>
    <date year="2013">November 26, 2013</date>
    <publisher>
        <city>New Haven</city>
        <press>Yale University Press</press>
    </publisher>
    <identifier type="ISBN-10">0300137230</identifier>
    <identifier type="ISBN-13">978-0300137231</identifier>
</book>

<book>
    <title>Women at War in the Classical World</title>
    <author>Paul Chrystal</author>
    <date year="2017">2017</date>
    <publisher>
        <city>Barnsley</city>
        <press>Pen and Sword Military</press>
    </publisher>
    <identifier type="ISBN-13">978-1-47385-660-8</identifier>
</book>
<book>
    <title>Greek Insects</title>
    <author>Malcom Davies and Jeyaraney Kathirithamby</author>
    <date year="1986">1986</date>
    <publisher>
        <city>Oxford and New York</city>
        <press>Oxford University Press</press>
    </publisher>
    <identifier type="ISBN-10">0-19-520548-0</identifier>
</book>
<book>
    <title>The Oxford Handbook of Maritime Archaeology</title>
    <author>Alexis Catsambis, Ben Ford, Donny L. Hamilton</author>
    <date year="2011">2011</date>
    <publisher>
        <city>Oxford</city>
        <press>Oxford University Press</press>
    </publisher>
    <identifier type="ISBN-13">978-0-19-933600-5</identifier>
</book>
<book>    <title>The Iliad</title>
    <author>Homer</author>
    <date year="1990">1990</date>
       <publisher>
            <city>New York</city>
            <press>Penguin Classics</press>
       </publisher>
       <identifier type="ISBN-10">0-14-027536-3</identifier>
</book>
</books>
};

let $books := $books/book
for $title in $books/title
return fn:concat(author, date, title, publisher/city, ":", publisher/press)
where $title = ("Women")
for $title in $book[fn:contains("Women"):)

(:let $books := $books/book
for $book in $books
order by $book/@author descending
return $book

let $books := $books/book
for $book in $books
order by $book/@title descending
return $book

let $books := $books/book
for $book in $books
order by $book/@date descending
return $book

let $books := $books/book
for $book in $books
order by $book/@date ascending 
return $book:)

(:Question 5:)

(:for $book in $list/book
order by $book/text()
count $n
return fn:concat($n, ". ", $book/text()):)

(:Question 6:)

for $book in $books/book
order by $book/@date descending, $book/text()
group by $date := $book/@date
return 
    <book published ="{$date}">
        {$book}
        </book>
        
(:Question 7:)
