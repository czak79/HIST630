xquery version "3.1";

declare context item := document {
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


/books/book/title/fn:contains(., "Women")

/books/[date/@year/xs:integer(.) gt 2019]

/books/book[fn:position() = (2)]

/books/book[fn:position() = (2 to 4)]

/books/book[fn:position() = (1, 5)]


