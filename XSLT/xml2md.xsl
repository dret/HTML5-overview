<?xml version="1.0" encoding="UTF-8"?>
<!-- This XSLT transforms https://github.com/dret/HTML5-overview into github-friendly markdown. -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output name="md-text" method="text" encoding="UTF-8"/>
    <xsl:variable name="status-index" select="( 'PER'                            , 'REC'            , 'PR'                      , 'CR'                       , 'WD'            , 'NOTE' , 'other', 'abandoned' )"/>
    <xsl:variable name="status-title" select="( 'Proposed Edited Recommendation' , 'Recommendation' , 'Proposed Recommendation' , 'Candidate Recommendation' , 'Working Draft' , 'Note' , 'Other', 'Abandoned' )"/>
    <xsl:variable name="md-path" select="'MD'"/>
    <xsl:template match="html5">
        <xsl:result-document href="README.md" format="md-text">
            <xsl:text># HTML5 Overview

HTML5 is more a movement (or maybe it's more appropriate to call it a *brand*) than it is a technology. It says "more power to the browser" but mostly means "more power to the browser *as a programming platform*". Given this focus of HTML5, it is surprisingly hard to find a good place where all the APIs under development are listed. This collection is an attempt to have all that information in one place. The current status captured here lists </xsl:text>
            <xsl:value-of select="count(//specs/spec)"/>
            <xsl:text> specifications. However, since the HTML5 landscape is changing fairly quickly, it is likely that some information on this page is outdated. If that is the case, please submit an issue or create a pull request (please keep in mind that the [MD](README.md) is generated from [XML](html5.xml) via [XSLT](XSLT/xml2md.xsl)). Thanks!

Most HTML5 specifications are [W3C](http://www.w3.org/ "World Wide Web Consortium") [TR track documents](http://www.w3.org/2014/Process-20140801/#rec-advance "W3C Technical Reports"), and of those this page lists </xsl:text>
            <xsl:value-of select="count(//specs/spec[@status = ('WD','CR','PER','PR','REC')])"/>
            <xsl:text> current specifications (grouped by status), while [a separate page lists </xsl:text>
            <xsl:value-of select="count(//specs/spec[@status = ('NOTE')])"/>
            <xsl:text> specifications where development has stopped](</xsl:text>
            <xsl:value-of select="$md-path"/>
            <xsl:text>/abandoned.md) (</xsl:text>
            <xsl:value-of select="count(//specs/spec[@status = ('WD','CR','PER','PR','REC','NOTE')])"/>
            <xsl:text> W3C documents overall). HTML5 specifications are also developed in other places, and this page lists </xsl:text>
            <xsl:value-of select="count(//specs/spec[@status eq 'other'])"/>
            <xsl:text> of these other specifications.

Here's a list of all current HTML5 specs (generated from [XML](html5.xml)), first W3C TR (grouped by status), and then others (except for the [separately listed abandoned specs](</xsl:text>
            <xsl:value-of select="$md-path"/>
            <xsl:text>/abandoned.md)):

## W3C TR Specifications (</xsl:text>
            <xsl:value-of select="count(//specs/spec[@status = ('WD','CR','PER','PR','REC')])"/>
            <xsl:text> Specs)&#xa;</xsl:text>
            <xsl:for-each-group select="//specs/spec" group-by="@status">
                <xsl:sort select="index-of($status-index, current-grouping-key())"/>
                <xsl:choose>
                    <xsl:when test="@status ne 'NOTE' and @status ne 'abandoned'">
                        <xsl:call-template name="generate-section"/>
                    </xsl:when>
                    <xsl:when test="@status eq 'NOTE'">
                        <xsl:result-document href="{$md-path}/abandoned.md" format="md-text">
                            <xsl:text># Abandoned HTML5 Specifications

This is a list of [W3C](http://www.w3.org/ "World Wide Web Consortium") HTML5 [NOTE documents](http://www.w3.org/2014/Process-20140801/#rec-advance "W3C Technical Reports"), which are documents that are no longer under development by the W3C, and other abandoned HTML5 specifications. For a list of stable or currently developed HTML5 documents, please visit the [HTML5 Overview's main page](../).&#xa;&#xa;</xsl:text>
                            <xsl:call-template name="generate-section"/>
                            <xsl:for-each-group select="//specs/spec[@status eq 'abandoned']" group-by="@status">
                                <xsl:call-template name="generate-section"/>
                            </xsl:for-each-group>
                        </xsl:result-document>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each-group>
            <xsl:text>&#xa;&#xa;If you're interested in history, [here's the change log](</xsl:text>
            <xsl:value-of select="$md-path"/>
            <xsl:text>/history.md).</xsl:text>
        </xsl:result-document>
        <xsl:result-document href="{$md-path}/history.md" format="md-text">
            <xsl:text># HTML5 Overview: Change Log&#xa;&#xa;</xsl:text>
                <xsl:for-each select="//log/entry">
                <xsl:sort select="@date" order="descending"/>
                <xsl:text>* </xsl:text>
                <xsl:value-of select="concat(format-date(@date, '[MNn] [D], [Y]', 'en', (), ()), ': ')"/>
                <xsl:apply-templates select="node()"/>
                <xsl:text>&#xa;</xsl:text>
            </xsl:for-each>
        </xsl:result-document>
    </xsl:template>
    <xsl:template name="generate-section">
        <xsl:choose>
            <xsl:when test="current-grouping-key() eq 'other'">
                <xsl:text>&#xa;## Non-W3C Specifications (</xsl:text>
            </xsl:when>
            <xsl:when test="current-grouping-key() eq 'abandoned'">
                <xsl:text>&#xa;### Abandoned Specifications (</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>&#xa;### </xsl:text>
                <xsl:value-of select="$status-title[index-of($status-index, current-grouping-key())]"/>
                <xsl:text>s (</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="count(current-group())"/>
        <xsl:text> Specs)&#xa;&#xa;</xsl:text>
        <xsl:if test="current-grouping-key() eq 'NOTE'">
            <xsl:text>Please keep in mind that [W3C NOTE documents have no official standing and often represent outdated or abandoned work](http://www.w3.org/2014/Process-20140801/#maturity-levels).&#xa;&#xa;</xsl:text>
        </xsl:if>
        <xsl:for-each select="current-group()">
            <xsl:sort select="title/text()"/>
            <xsl:text>* [</xsl:text>
            <xsl:value-of select="title/text()"/>
            <xsl:text>](</xsl:text>
            <xsl:if test="current-grouping-key() ne 'other'">
                <xsl:text>http://www.w3.org/TR/</xsl:text>
            </xsl:if>
            <xsl:value-of select="@id"/>
            <xsl:text> "</xsl:text>
            <xsl:value-of select="replace(abstract,'&quot;', '&#x201d;')"/>
            <xsl:text>"</xsl:text>
            <xsl:text>)</xsl:text>
            <xsl:if test="exists(@ed)">
                <xsl:text> ([ED](</xsl:text>
                <xsl:value-of select="@ed"/>
                <xsl:text> "Editor's Draft"))</xsl:text>
            </xsl:if>
            <xsl:text>&#xa;</xsl:text>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="a">
        <xsl:text>[</xsl:text>
        <xsl:apply-templates select="node()"/>
        <xsl:text>](</xsl:text>
        <xsl:value-of select="@href"/>
        <xsl:text>)</xsl:text>
    </xsl:template>
    <xsl:template match="q">
        <xsl:text>"</xsl:text>
        <xsl:apply-templates select="node()"/>
        <xsl:text>"</xsl:text>
    </xsl:template>
</xsl:stylesheet>