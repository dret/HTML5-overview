<?xml version="1.0" encoding="UTF-8"?>
<!-- This XSLT transforms https://github.com/dret/HTML5-overview into http://dret.typepad.com/dretblog/html5-api-overview.html -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xhtml" indent="yes"/>
    <xsl:variable name="doc" select="."/>
    <xsl:key name="classes" match="/html5/classdefs/classdef" use="@id"/>
    <xsl:template match="html5">
        <body>
            <xsl:text>&#xa;</xsl:text>
            <p>HTML5 is more a movement (or maybe it's more appropriate to call it a <q>brand</q>) than it is a technology. it says <q>more power to the browser</q> and mostly means <q>more power to the browser <em>as a programming platform</em></q>. given this focus of HTML5, it is surprisingly hard to find a good place where all the APIs under development are listed. this page is an attempt to collect that information in one place. the current status captured on this page lists <xsl:value-of select="count(//specs/spec[@status ne 'NOTE'])"/> current specifications and <xsl:value-of select="count(//specs/spec[@status eq 'NOTE'])"/> expired specifications (<xsl:value-of select="count(//specs/spec)"/> total). since the HTML5 landscape is changing fairly quickly, it is likely that some information on this page is outdated. if that is the case, please <a href="mailto:dret@berkeley.edu">get in touch</a> so that i can update the page. thanks!</p>
            <table id="classification-table" border="1">
                <thead>
                    <tr>
                        <th>Spec Type</th>
                        <th>Specs</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="(/html5/classdefs/classdef/@title, '(none)')">
                        <xsl:sort select="."/>
                        <tr>
                            <td>
                                <xsl:value-of select="."/>
                            </td>
                            <td>
                                <xsl:for-each select="$doc//specs/spec[ if ( current() ne '(none)' ) then ( class/@ref eq current()/../@id ) else empty(class) ]">
                                    <xsl:sort select="title/text()"/>
                                    <a href="#{@id}" title="{abstract/node()}">
                                        <xsl:value-of select="title/text()"/>
                                    </a>
                                    <sup>
                                        <xsl:choose>
                                            <xsl:when test="@status eq 'WD'"><span title="Working Draft" style="font-size : x-small">WD</span></xsl:when>
                                            <xsl:when test="@status eq 'CR'"><span title="Candidate Recommendation" style="font-size : x-small">CR</span></xsl:when>
                                            <xsl:when test="@status eq 'PER'"><span title="Proposed Edited Recommendation" style="font-size : x-small">PER</span></xsl:when>
                                            <xsl:when test="@status eq 'PR'"><span title="Proposed Recommendation" style="font-size : x-small">PR</span></xsl:when>
                                            <xsl:when test="@status eq 'REC'"><span title="Recommendation" style="font-size : x-small">REC</span></xsl:when>
                                        </xsl:choose>
                                    </sup>
                                    <xsl:text> </xsl:text>
                                </xsl:for-each>
                            </td>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
            <p>here is a list of the functionality and APIs currently under development as standalone documents in the W3C (links are to the latest version, order is alphabetical by title, the list contains <xsl:value-of select="count(//specs/spec[@status ne 'NOTE'])"/> specs):</p>
            <ul class="current">
                <xsl:for-each select="//specs/spec[@status ne 'NOTE']">
                    <xsl:sort select="title/text()"/>
                    <li id="{@id}">
                        <a href="http://www.w3.org/TR/{@id}" title="#{@id}">
                            <xsl:value-of select="title/text()"/>
                        </a>
                        <sup>
                            <xsl:choose>
                                <xsl:when test="@status eq 'WD'"><span title="Working Draft" style="font-size : x-small">WD</span></xsl:when>
                                <xsl:when test="@status eq 'CR'"><span title="Candidate Recommendation" style="font-size : x-small">CR</span></xsl:when>
                                <xsl:when test="@status eq 'PER'"><span title="Proposed Edited Recommendation" style="font-size : x-small">PER</span></xsl:when>
                                <xsl:when test="@status eq 'PR'"><span title="Proposed Recommendation" style="font-size : x-small">PR</span></xsl:when>
                                <xsl:when test="@status eq 'REC'"><span title="Recommendation" style="font-size : x-small">REC</span></xsl:when>
                            </xsl:choose>
                        </sup>
                        <xsl:text>: </xsl:text>
                        <xsl:copy-of select="abstract/node()"/>
                        <xsl:if test="exists(class)">
                            <xsl:text> </xsl:text>
                            <em>
                                <xsl:text>(Spec type: </xsl:text>
                                <xsl:value-of select="key('classes', class/@ref)/@title"/>
                                <xsl:text>)</xsl:text>
                            </em>
                        </xsl:if>
                    </li>
                </xsl:for-each>
            </ul>
            <p>here is a list of specifications that have been officially deprecated or where development has been discontinued (alphabetical order, the list contains <xsl:value-of select="count(//specs/spec[@status eq 'NOTE'])"/> specs):</p>
            <ul class="expired">
                <xsl:for-each select="//specs/spec[@status eq 'NOTE']">
                    <xsl:sort select="title/text()"/>
                    <li id="{@id}">
                        <a href="http://www.w3.org/TR/{@id}" title="#{@id}">
                            <xsl:value-of select="title/text()"/>
                        </a>
                        <sup>
                            <xsl:choose>
                                <xsl:when test="@status eq 'NOTE'"><span title="Note" style="font-size : x-small">NOTE</span></xsl:when>
                            </xsl:choose>
                        </sup>
                        <xsl:text>: </xsl:text>
                        <xsl:copy-of select="abstract/node()"/>
                        <xsl:if test="exists(class)">
                            <xsl:text> </xsl:text>
                            <em>
                                <xsl:text>(Spec type: </xsl:text>
                                <xsl:value-of select="key('classes', class/@ref)/@title"/>
                                <xsl:text>)</xsl:text>
                            </em>
                        </xsl:if>
                    </li>
                </xsl:for-each>
            </ul>
            <p>change log (latest first):</p>
            <ul class="log">
                <xsl:for-each select="//log/entry">
                    <xsl:sort select="@date" order="descending"/>
                    <li id="log-{@date}">
                        <xsl:value-of select="concat(format-date(@date, '[MNn] [D], [Y]', 'en', (), ()), ': ')"/>
                        <xsl:copy-of select="node()"/>
                    </li>
                </xsl:for-each>
            </ul>
            <xsl:text>&#xa;</xsl:text>
        </body>
    </xsl:template>
</xsl:stylesheet>