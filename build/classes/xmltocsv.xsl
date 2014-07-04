<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">

<xsl:output method="text"/>
   <xsl:strip-space elements="*"/>
   
<xsl:param name="delimiter" select="','"/>

<xsl:variable name="headers">
    <header>AtomicNumber</header>
    <header>Name</header>
    <header>Symbol</header>
    <header>NumberOfNeutrons</header>
    <header>MolarMass(grams)</header>
    <header>IonizationEnergy(kcal/mole)</header>
</xsl:variable>

<xsl:template match="/">
      <xsl:value-of select="headers/header" separator="{delimiter}"/>
      <xsl:text>&#xa;</xsl:text>
      <xsl:apply-templates/>
   </xsl:template>
   
<xsl:for-each select="chemistry/periodic_row">
    <xsl:for-each select="element">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:value-of select="."></xsl:value-of>
        <xsl:value-of select="."></xsl:value-of>
        <xsl:apply-templates select="property"></xsl:apply-templates>
    </xsl:for-each>
</xsl:for-each>

<xsl:template match="periodic_row">
            <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="element">
        <xsl:apply-templates select="atomic_no"></xsl:apply-templates>
        <xsl:apply-templates select="name"></xsl:apply-templates>
        <xsl:apply-templates select="symbol"></xsl:apply-templates>
        <xsl:apply-templates select="property"></xsl:apply-templates>
    </xsl:template>

    <xsl:template match="property">
        <xsl:apply-templates select="no_of_neutrons"></xsl:apply-templates>
        <xsl:apply-templates select="molar_mass"></xsl:apply-templates>
        <xsl:apply-templates select="ionization_energy"></xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="atomic_no">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>.</xsl:text>
    </xsl:template>

    <xsl:template match="name">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>.</xsl:text>
    </xsl:template>

    <xsl:template match="symbol">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>.</xsl:text>
    </xsl:template>
    
    <xsl:template match="no_of_neutrons">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>.</xsl:text>
    </xsl:template>

    <xsl:template match="molar_mass">
        <xsl:apply-templates select="value"></xsl:apply-templates>
        <!--<xsl:apply-templates select="units"></xsl:apply-templates>-->
    </xsl:template>

    <xsl:template match="value">
        <xsl:value-of select="."/>
    </xsl:template>
    <!--
    <xsl:template match="units">
        <xsl:value-of select="."/>
    </xsl:template>
    -->
    <xsl:template match="ionization_energy">
        <xsl:apply-templates select="value"></xsl:apply-templates>
        <!--<xsl:apply-templates select="units"></xsl:apply-templates>-->
    </xsl:template>
    
    <xsl:template match="value">
        <xsl:value-of select="."/>
    </xsl:template>
    <!--
    <xsl:template match="units">
        <xsl:value-of select="."/>
    </xsl:template>
    -->
</xsl:stylesheet>

	