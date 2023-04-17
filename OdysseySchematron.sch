<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>

    <sch:pattern>
        <sch:rule context="tei:body/tei:persName/@type">
            <sch:assert test=". = 'deity'">
                If there is a type attribute in the body, it must be 'deity.'
            </sch:assert>
        </sch:rule>
        <sch:rule context="tei:teiHeader/@type">
            <sch:assert test=". = 'author' or . = 'translator'"></sch:assert>
        </sch:rule>
        <sch:rule context="tei:persName/@ref">
            <sch:let name="personRef" value="doc('https://raw.githubusercontent.com/czak79/HIST630/main/OdysseyStandoffMarkup.xml?token=GHSAT0AAAAAACBAGFCJYMDCD5TZREJVCZFIZBVY6JA')"/>
             <sch:let name="allRefs"
                    value="$personRef//tei:person/@ref"/>
            <sch:let name="error" value ="."/>
            <sch:assert test=" every $i in . satisfies $i = $allRefs" role="warning">
                <sch:value-of select="$error"/> is not currently in use.
            </sch:assert>        
        </sch:rule>
        <sch:rule context="tei:placeName/@ref">
            <sch:let name="placeRef" value="doc('https://raw.githubusercontent.com/czak79/HIST630/main/OdysseyStandoffMarkup.xml?token=GHSAT0AAAAAACBAGFCJYMDCD5TZREJVCZFIZBVY6JA')"/>
            <sch:let name="allRefs"
                value="$placeRef//tei:place/@ref"/>
            <sch:let name="error" value ="."/>
            <sch:assert test=" every $i in . satisfies $i = $allRefs" role="warning">
                <sch:value-of select="$error"/> is not currently in use.
            </sch:assert>        
        </sch:rule>
        <sch:rule context="tei:orgName/@ref">
            <sch:let name="orgRef" value="doc('https://raw.githubusercontent.com/czak79/HIST630/main/OdysseyStandoffMarkup.xml?token=GHSAT0AAAAAACBAGFCJYMDCD5TZREJVCZFIZBVY6JA')"/>
            <sch:let name="allRefs"
                value="$orgRef//tei:organization/@ref"/>
            <sch:let name="error" value ="."/>
            <sch:assert test=" every $i in . satisfies $i = $allRefs" role="warning">
                <sch:value-of select="$error"/> is not currently in use.
            </sch:assert>        
        </sch:rule>
    </sch:pattern>
</sch:schema>