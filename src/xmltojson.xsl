<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0">

	<!-- Turn off auto-insertion of <?xml> tag and set indenting on -->
	<xsl:output method="text" encoding="utf-8" indent="yes" />
	<xsl:template match="/">
		<xsl:text>{</xsl:text>
		<xsl:text>&#xa;</xsl:text>
		<xsl:text>"</xsl:text>
		<xsl:text>chemistry</xsl:text>
		<xsl:text>": {</xsl:text>
		<xsl:apply-templates></xsl:apply-templates>
		<xsl:text>}</xsl:text>
		<xsl:text>}</xsl:text>
	</xsl:template>

        <xsl:template match="periodic_row">
		<xsl:text>"</xsl:text>
		<xsl:value-of select="name()"></xsl:value-of>
		<xsl:text>": [</xsl:text>
		<xsl:text>&#xa;</xsl:text>
		<xsl:text>{</xsl:text>
		<xsl:apply-templates></xsl:apply-templates>
		<xsl:text>},</xsl:text>
		<xsl:text>&#xa;</xsl:text>
		<xsl:text>]</xsl:text>
	</xsl:template>

	<xsl:template match="element">
		<xsl:text>"</xsl:text>
		<xsl:value-of select="name()"></xsl:value-of>
		<xsl:text>": [</xsl:text>
		<xsl:text>&#xa;</xsl:text>
		<xsl:text>{</xsl:text>
		<xsl:apply-templates></xsl:apply-templates>
		<xsl:text>},</xsl:text>
		<xsl:text>&#xa;</xsl:text>
		<xsl:text>]</xsl:text>
	</xsl:template>
        
	<xsl:for-each select="chemistry/periodic_row">
		<xsl:for-each select="element">
			<xsl:apply-templates select="atomic_no"></xsl:apply-templates>
			<xsl:apply-templates select="name"></xsl:apply-templates>
			<xsl:apply-templates select="symbol"></xsl:apply-templates>
			<xsl:apply-templates select="property"></xsl:apply-templates>
		</xsl:for-each>
	</xsl:for-each>
        
	<xsl:template match="atomic_no">
		<xsl:text>"</xsl:text>
		<xsl:value-of select="name()"></xsl:value-of>
		<xsl:text>": "</xsl:text>
		<xsl:value-of select="."></xsl:value-of>
		<xsl:text>",</xsl:text>
	</xsl:template>

	<xsl:template match="name">
		<xsl:text>"</xsl:text>
		<xsl:value-of select="name()"></xsl:value-of>
		<xsl:text>": "</xsl:text>
		<xsl:value-of select="."></xsl:value-of>
		<xsl:text>",</xsl:text>
	</xsl:template>

	<xsl:template match="symbol">
		<xsl:text>"</xsl:text>
		<xsl:value-of select="name()"></xsl:value-of>
		<xsl:text>": "</xsl:text>
		<xsl:value-of select="."></xsl:value-of>
		<xsl:text>",</xsl:text>
	</xsl:template>

	<xsl:template match="property">
		<xsl:text>"</xsl:text>
		<xsl:value-of select="name()"></xsl:value-of>
		<xsl:text>": {</xsl:text>
		<xsl:text>&#xa;</xsl:text>
		<xsl:apply-templates select="no_of_neutrons"></xsl:apply-templates>
		<xsl:apply-templates select="molar_mass"></xsl:apply-templates>
		<xsl:apply-templates select="ionization_energy"></xsl:apply-templates>
		<xsl:text>}</xsl:text>
	</xsl:template>

	<xsl:template match="no_of_neutrons">
		<xsl:text>"</xsl:text>
		<xsl:value-of select="name()"></xsl:value-of>
		<xsl:text>": "</xsl:text>
		<xsl:value-of select="."></xsl:value-of>
		<xsl:text>",</xsl:text>
		<xsl:text>&#xa;</xsl:text>
	</xsl:template>

	<xsl:template match="molar_mass">
		<xsl:text>"</xsl:text>
		<xsl:value-of select="name()"></xsl:value-of>
		<xsl:text>": {</xsl:text>
		<xsl:text>&#xa;</xsl:text>
		<xsl:apply-templates select="value"></xsl:apply-templates>
		<xsl:apply-templates select="units"></xsl:apply-templates>
		<xsl:text>},</xsl:text>
		<xsl:text>&#xa;</xsl:text>
	</xsl:template>

	<xsl:template match="value">
		<xsl:text>"</xsl:text>
		<xsl:value-of select="name()"></xsl:value-of>
		<xsl:text>": "</xsl:text>
		<xsl:value-of select="."></xsl:value-of>
		<xsl:text>",</xsl:text>
		<xsl:text>&#xa;</xsl:text>
	</xsl:template>

	<xsl:template match="units">
		<xsl:text>"</xsl:text>
		<xsl:value-of select="name()"></xsl:value-of>
		<xsl:text>": "</xsl:text>
		<xsl:value-of select="."></xsl:value-of>
		<xsl:text>&#xa;</xsl:text>
	</xsl:template>

	<xsl:template match="ionization_energy">
		<xsl:text>"</xsl:text>
		<xsl:value-of select="name()"></xsl:value-of>
		<xsl:text>": {</xsl:text>
		<xsl:text>&#xa;</xsl:text>
		<xsl:apply-templates select="value"></xsl:apply-templates>
		<xsl:apply-templates select="units"></xsl:apply-templates>
		<xsl:text>},</xsl:text>
		<xsl:text>&#xa;</xsl:text>
	</xsl:template>

	<xsl:template match="value">
		<xsl:text>"</xsl:text>
		<xsl:value-of select="name()"></xsl:value-of>
		<xsl:text>": "</xsl:text>
		<xsl:value-of select="."></xsl:value-of>
		<xsl:text>",</xsl:text>
		<xsl:text>&#xa;</xsl:text>
	</xsl:template>

	<xsl:template match="units">
		<xsl:text>"</xsl:text>
		<xsl:value-of select="name()"></xsl:value-of>
		<xsl:text>": "</xsl:text>
		<xsl:value-of select="."></xsl:value-of>
		<xsl:text>&#xa;</xsl:text>
	</xsl:template>

</xsl:stylesheet>
