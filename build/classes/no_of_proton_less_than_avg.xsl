<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:redirect="http://xml.apache.org/xalan/redirect"
                extension-element-prefixes="redirect" version="1.0">

    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="avg_n" select="sum(//atomic_no[text()])div count(//atomic_no)" />
    <xsl:template match="/">
        <chemistry>
            <xsl:apply-templates></xsl:apply-templates>
        </chemistry>
    </xsl:template>

    <xsl:for-each select="chemistry/periodic_row">
        <xsl:for-each select="element">
            <xsl:apply-templates select="."></xsl:apply-templates>
            <xsl:apply-templates select="."></xsl:apply-templates>
            <xsl:apply-templates select="property"></xsl:apply-templates>
        </xsl:for-each>
    </xsl:for-each>
        
    <xsl:template match="periodic_row">
        <periodic_row>
            <xsl:apply-templates/>
        </periodic_row>
    </xsl:template>

    <xsl:template match="element">
        <xsl:if test="//element/atomic_no[. &lt; $avg_n]">
            <element>
                <xsl:apply-templates select="atomic_no"></xsl:apply-templates>
                <xsl:apply-templates select="symbol"></xsl:apply-templates>
                <xsl:apply-templates select="name"></xsl:apply-templates>
                <xsl:apply-templates select="property"></xsl:apply-templates>
            </element>
        </xsl:if>
    </xsl:template>

    <xsl:template match="property">
        <property>
            <xsl:apply-templates select="molar_mass"></xsl:apply-templates>
            <xsl:apply-templates select="ionization_energy"></xsl:apply-templates>
        </property>
    </xsl:template>

    <xsl:template match="atomic_no">
        <atomic_no>
            <xsl:value-of select="."></xsl:value-of>
        </atomic_no>
    </xsl:template>

    <xsl:template match="symbol">
        <symbol>
            <xsl:value-of select="."></xsl:value-of>
        </symbol>
    </xsl:template>

    <xsl:template match="name">
        <name>
            <xsl:value-of select="."></xsl:value-of>
        </name>
    </xsl:template>

    <xsl:template match="molar_mass">
        <molar_mass>
            <xsl:apply-templates select="value"></xsl:apply-templates>
            <xsl:apply-templates select="units"></xsl:apply-templates>
        </molar_mass>
    </xsl:template>
    
    <xsl:template match="value">
        <value>
            <xsl:value-of select="."/>
        </value>
    </xsl:template>
    
    <xsl:template match="units">
        <units>
            <xsl:value-of select="."/>
        </units>
    </xsl:template>

    <xsl:template match="ionization_energy">
        <ionization_energy>
            <xsl:apply-templates select="value"></xsl:apply-templates>
            <xsl:apply-templates select="units"></xsl:apply-templates>
        </ionization_energy>
    </xsl:template>
    
    <xsl:template match="value">
        <value>
            <xsl:value-of select="."/>
        </value>
    </xsl:template>
    
    <xsl:template match="units">
        <units>
            <xsl:value-of select="."/>
        </units>
    </xsl:template>

</xsl:stylesheet>

