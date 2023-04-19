<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>

    <sch:pattern>
        <sch:rule context="tei:teiHeader/@type">
            <sch:assert test=". = 'author' or . = 'translator'"></sch:assert>
        </sch:rule>
       
        <sch:rule context="tei:persName/@ref">
            <sch:let name="personRef" value="doc('https://raw.githubusercontent.com/czak79/HIST630/main/OdysseyStandoffMarkup.xml?token=GHSAT0AAAAAACBAGFCJYMDCD5TZREJVCZFIZBVY6JA')"/>
             <sch:let name="personIDs"
                    value="$personRef//tei:person/@xml:id"/>
            <sch:let name="error" value ="."/>
            <sch:assert test=" every $i in (tokenize(., ' ')) satisfies $i = $personIDs" role="warning">
                <!--could do (tokenize(., ' ')) for multiple instances of the thing like multiple events in a row but we really don't need it here since there aren't multiple-->
                <sch:value-of select="$error"/> is not currently in use.
            </sch:assert>        
        </sch:rule>
        
        <!--<sch:rule context="tei:persName">
            <sch:let name="standoff" value="doc('https://raw.githubusercontent.com/czak79/HIST630/main/OdysseyStandoffMarkup.xml?token=GHSAT0AAAAAACBAGFCJYMDCD5TZREJVCZFIZBVY6JA')"/>
            <sch:let name="personIDs"
                    value="$standoff//person/@xml:id"/>
            <sch:let name="error" value="."/>
            <sch:assert
                    test="@ref = $personIDs"/>
                <sch:value-of select="$error"/>Acceptable values are:
                <sch:value-of select="personIDs"/> 
            </sch:assert>
        </sch:rule>-->
       
        <sch:rule context="tei:placeName/@ref">
            <sch:let name="placeRef" value="doc('https://raw.githubusercontent.com/czak79/HIST630/main/OdysseyStandoffMarkup.xml?token=GHSAT0AAAAAACBAGFCJYMDCD5TZREJVCZFIZBVY6JA')"/>
            <sch:let name="placeIDs"
                value="$placeRef//tei:place/@xml:id"/>
            <sch:let name="error" value ="."/>
            <sch:assert test=" every $i in (tokenize(., ' ')) satisfies $i = $placeIDs" role="warning">
                <sch:value-of select="$error"/> is not currently in use.
            </sch:assert>        
        </sch:rule>
       
        <sch:rule context="tei:orgName/@ref">
            <sch:let name="orgRef" value="doc('https://raw.githubusercontent.com/czak79/HIST630/main/OdysseyStandoffMarkup.xml?token=GHSAT0AAAAAACBAGFCJYMDCD5TZREJVCZFIZBVY6JA')"/>
            <sch:let name="orgIDs"
                value="$orgRef//tei:organization/@xml:id"/>
            <sch:let name="error" value ="."/>
            <sch:assert test=" every $i in (tokenize(., ' ')) satisfies $i = $orgIDs" role="warning">
                <sch:value-of select="$error"/> is not currently in use.
            </sch:assert>        
        </sch:rule>
    </sch:pattern>
</sch:schema>