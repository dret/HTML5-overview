<?xml version="1.0" encoding="UTF-8"?>
<!-- This XSLT transforms https://github.com/dret/HTML5-overview into a jekyll site. -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
    <xsl:output name="jekyll" method="text" encoding="UTF-8"/>
    <xsl:variable name="post-dir" select="'_posts'"/>
    <!-- -->
    <xsl:template match="/">
        <xsl:for-each select="//log/entry">
            <xsl:variable name="date" select="format-date(@date, '[Y0001]-[M01]-[D01]')"/>
            <xsl:result-document href="{$post-dir}/{$date}-update.md" format="jekyll">
                <xsl:text>---&#xa;</xsl:text>
                <xsl:text>layout: post&#xa;</xsl:text>
                <xsl:text>title:  "</xsl:text>
                <xsl:value-of select="replace(string-join(.//text()), '&#34;', '&amp;#34;')"/>
                <xsl:text>"&#xa;</xsl:text>
                <xsl:text>date:   </xsl:text>
                <xsl:value-of select="$date"/>
                <xsl:text>&#xa;</xsl:text>
                <xsl:text>---&#xa;&#xa;</xsl:text>
                <xsl:apply-templates select="node()"/>
                <xsl:text>&#xa;&#xa;</xsl:text>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="a">
        <xsl:text>[</xsl:text>
        <xsl:value-of select=".//text()"/>
        <xsl:text>](</xsl:text>
        <xsl:value-of select="@href"/>
        <xsl:text>)</xsl:text>
    </xsl:template>
</xsl:stylesheet>