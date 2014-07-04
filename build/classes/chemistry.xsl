<?xml version="1.0"?>

<!-- <xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl"> -->

<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Periodical Table of the Elements</title>
                <link ref="stylesheet" type="text/css" href="chemistry.css"/>
            </head>
            <body>
                <h1 align = "center">Periodical Table of the Elements</h1>
                <table cellspacing="5" cellpadding="5" width="1000">
                    <xsl:for-each select="chemistry/periodic_row">
                        <tr>
                            <xsl:for-each select="element">
                                <xsl:choose>
                                    <xsl:when test="atomic_no[. = 2]">
                                        <td colspan="16" width = "800"></td>
                                        <TD bgcolor="yellow" align="center" valign="top" width="50">
                                            <xsl:apply-templates select="."/>
                                        </TD>
                                    </xsl:when>				
                                    <xsl:when test="atomic_no[. = 5]">
                                        <td align="center" valign="top" colspan="10" rowspan="2" width="800">
                                            <img src="atom2.gif" width="250" height="200"></img>
                                        </td>
                                        <TD bgcolor="yellow" align="center" valign="top" width="50">
                                            <xsl:apply-templates select="."/>
                                        </TD>
                                    </xsl:when>	
                                    <xsl:when test="atomic_no[. = 57]">
                                        <TD bgcolor="yellow" align="center" valign="top" width="50">
                                            <xsl:apply-templates select="atomic_no"/>
                                            <b>
                                                <font color="blue" size="5">
                                                    <xsl:value-of select="symbol"/>*
                                                </font>
                                            </b>
                                            <br/>
                                            <xsl:apply-templates select="name"/>
                                            <xsl:apply-templates select="property"/>   
                                        </TD>
                                    </xsl:when>							
                                    <xsl:when test="atomic_no[. = 89]">
                                        <TD bgcolor="yellow" align="center" valign="top" width="50">
                                            <xsl:apply-templates select="atomic_no"/>
                                            <b>
                                                <font color="blue" size="5">
                                                    <xsl:value-of select="symbol"/>**
                                                </font>
                                            </b>
                                            <br/>
                                            <xsl:apply-templates select="name"/>
                                            <xsl:apply-templates select="property"/>   
                                        </TD>
                                    </xsl:when>							
                                    <xsl:when test="atomic_no[. &gt; 57  and . &lt; 72]">
                                    </xsl:when>				
                                    <xsl:when test="atomic_no[. &gt; 89  and . &lt; 104]">
                                    </xsl:when>	
                                    <xsl:when test="atomic_no[. = 115 or . = 117]">
                                        <td colspan="1" width = "50"></td>			
                                    </xsl:when>				
                                    <xsl:otherwise>
                                        <TD bgcolor="yellow" align="center" valign="top" width="50">
                                            <xsl:apply-templates select="."/>
                                        </TD>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                        </tr>
                    </xsl:for-each>
                </table>
                <br/> 
                <br/>
		
                <table cellspacing="5" cellpadding="5" width="1000" >
                    <xsl:for-each select="chemistry/periodic_row">
                        <tr>
                            <xsl:for-each select="element">
                                <xsl:choose>
                                    <xsl:when test="atomic_no[. = 57]">
                                        <TD align="center" valign="center" width="200">
                                            <b>
                                                <font color="red" size="5">*Lanthanides</font>
                                            </b>
                                        </TD>
                                    </xsl:when>							
                                    <xsl:when test="atomic_no[. = 89]">
                                        <TD align="center" valign="center" width="200">
                                            <b>
                                                <font color="red" size="5">**Actinides</font>
                                            </b>
                                        </TD>
                                    </xsl:when>							
                                    <xsl:when test="atomic_no[. &gt; 57  and . &lt; 72]">
                                        <TD bgcolor="cyan" align="center" valign="top" width="50">
                                            <xsl:apply-templates select="."/>
                                        </TD>
                                    </xsl:when>							
                                    <xsl:when test="atomic_no[. &gt; 89  and . &lt; 104]">
                                        <TD bgcolor="#FFE7C6" align="center" valign="top" width="50">
                                            <xsl:apply-templates select="."/>
                                        </TD>
                                    </xsl:when>		
                                </xsl:choose>
                            </xsl:for-each>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template> 

    <xsl:template match="periodic_row">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="element"> 
        <xsl:apply-templates select="atomic_no"/>
        <xsl:apply-templates select="symbol"/>
        <xsl:apply-templates select="name"/>
        <xsl:apply-templates select="property"/>   
    </xsl:template>

    <xsl:template match="atomic_no"> 
        <b>
            <font color="red" size="6">
                <xsl:value-of select="."/>
            </font>
        </b>
        <br/>
    </xsl:template>


    <xsl:template match="symbol"> 	 	
        <b>
            <font color="blue" size="5">
                <xsl:value-of select="."/>
            </font>
        </b>
        <br/> 
    </xsl:template>
		
		
    <xsl:template match="name"> 
        <b>
            <font color="blue" size="2">
                <xsl:value-of select="."/>
            </font>
        </b>
        <br/>
        <br/>
    </xsl:template>
		
		
    <xsl:template match="property"> 
        <xsl:apply-templates select="molar_mass"/>
        <br/>
        <xsl:apply-templates select="ionization_energy"/>
    </xsl:template>
		
 		
    <xsl:template match="molar_mass"> 
        <b>
            <font color="black" size="2">
                <xsl:value-of select="value"/>
                <br/>
                <xsl:value-of select="units"/>
            </font>
        </b>
    </xsl:template>
 	
 		
		
    <xsl:template match="ionization_energy"> 
        <xsl:if test="string-length(./value) > 0">
            <b>
                <font color="green" size="2">
                    <xsl:value-of select="value"/>
                    <br/>
                    <xsl:value-of select="units"/>
                </font>
            </b>
        </xsl:if>
    </xsl:template>
	

</xsl:stylesheet>

