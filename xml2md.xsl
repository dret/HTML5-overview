<?xml version="1.0" encoding="UTF-8"?>
<!-- This XSLT transforms https://github.com/dret/HTML5-overview into github-friendly markdown. -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output name="md-text" method="text" encoding="UTF-8"/>
    <xsl:variable name="status-index" select="( 'WD'            , 'CR'                       , 'PR'                      , 'REC'            , 'PER'                            , 'NOTE' )"/>
    <xsl:variable name="status-title" select="( 'Working Draft' , 'Candidate Recommendation' , 'Proposed Recommendation' , 'Recommendation' , 'Proposed Edited Recommendation' , 'Note' )"/>
    <xsl:key name="classes" match="/html5/classdefs/classdef" use="@id"/>
    <xsl:template match="html5">
        <xsl:result-document href="README.md" format="md-text">
            <xsl:text>HTML5 Overview
==============

An overview of all HTML5 standardization activities. For now, this content is also [published on my blog](http://dret.typepad.com/dretblog/html5-api-overview.html) by [transforming it to HTML](xml2html.xsl), but this may change over time.

HTML5 is more a movement (or maybe it's more appropriate to call it a *brand*) than it is a technology. it says "more power to the browser" and mostly means "more power to the browser *as a programming platform*". Given this focus of HTML5, it is surprisingly hard to find a good place where all the APIs under development are listed. This collection is an attempt to have all that information in one place. The current status captured on this page lists </xsl:text>
            <xsl:value-of select="count(//specs/spec[@status ne 'NOTE'])"/>
            <xsl:text> current specifications and </xsl:text>
            <xsl:value-of select="count(//specs/spec[@status eq 'NOTE'])"/>
            <xsl:text> expired specifications (</xsl:text>
            <xsl:value-of select="count(//specs/spec)"/>
            <xsl:text> total). Since the HTML5 landscape is changing fairly quickly, it is likely that some information on this page is outdated. If that is the case, please submit an issue or create a pull request. Thanks!

I am currently working on making this page as complete as the blog page. As a starting point, here's a status-ordered list of all HTML5 specs covered in the [XML source for this page](html5.xml), containing a total of </xsl:text>
            <xsl:value-of select="count(//specs/spec)"/>
            <xsl:text> specs (for a classification and abstracts, [please visit the blog for now](http://dret.typepad.com/dretblog/html5-api-overview.html) or [use the XML source](html5.xml)):&#xa;&#xa;</xsl:text>
            <xsl:for-each-group select="//specs/spec" group-by="@status">
                <xsl:sort select="index-of($status-index, current-grouping-key())"/>
                <xsl:text>&#xa;</xsl:text>
                <xsl:value-of select="$status-title[index-of($status-index, current-grouping-key())]"/>
                <xsl:text>&#xa;----------------&#xa;&#xa;</xsl:text>
                <xsl:for-each select="current-group()">
                    <xsl:sort select="title/text()"/>
                    <xsl:text>* [</xsl:text>
                    <xsl:value-of select="title/text()"/>
                    <xsl:text>](http://www.w3.org/TR/</xsl:text>
                    <xsl:value-of select="@id"/>
<!--
                    <xsl:text> "</xsl:text>
                    <xsl:value-of select="abstract"/>
                    <xsl:text>"</xsl:text>
-->
                    <xsl:text>)&#xa;</xsl:text>
                </xsl:for-each>
            </xsl:for-each-group>
            <xsl:text>&#xa;&#xa;If you're interested in history, [here's the change log](history.md).</xsl:text>
        </xsl:result-document>
        <xsl:result-document href="history.md" format="md-text">
            <xsl:text>HTML5 Overview: Change Log&#xa;==========================&#xa;&#xa;</xsl:text>
                <xsl:for-each select="//log/entry">
                <xsl:sort select="@date" order="descending"/>
                <xsl:text>* </xsl:text>
                <xsl:value-of select="concat(format-date(@date, '[MNn] [D], [Y]', 'en', (), ()), ': ')"/>
                <xsl:copy-of select="node()"/>
                <xsl:text>&#xa;</xsl:text>
            </xsl:for-each>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>