<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xml="http://www.w3.org/XML/1998/namespace" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                version="2.0" xsi:schemaLocation="http://www.intershop.com/xml/ns/enfinity/7.1/xcs/impex"
                exclude-result-prefixes="xsi">
    <xsl:param name="materialNumber"/>
    <xsl:param name="validFrom"/>
    <xsl:param name="changeNumber"/>
    <xsl:template match="/">
        <xsl:call-template name="master"/>
    </xsl:template>
   
    <!-- The master XSLT -->
    <xsl:template name="master">
        <bapirfc>
            <xsl:attribute name="name">
                <xsl:value-of select="'Z_PP_BOM_QUERY_BY_MATERIAL'"/>
            </xsl:attribute>
            <import>
                <field>
                    <xsl:attribute name="name">
                        <xsl:value-of select="'I_MATERIAL'"/>
                    </xsl:attribute>
                     <xsl:value-of select="substring(concat('000000000000000000', $materialNumber), string-length($materialNumber)+1)"/>                </field>
                <xsl:choose>
                        <xsl:when test="$validFrom != ''">
                            <field>
                                <xsl:attribute name="name">
                                    <xsl:value-of select="'I_VALID_FROM'"/>
                                </xsl:attribute>
                                <xsl:value-of select="$validFrom"/>
                            </field>
                        </xsl:when>
                        <xsl:otherwise/>
                </xsl:choose>
                      <xsl:choose>
                        <xsl:when test="$changeNumber != ''">
                           <field>
                                <xsl:attribute name="name">
                                  <xsl:value-of select="'I_CHANGE_NO'"/>
                                </xsl:attribute>
                                 <xsl:value-of select="$changeNumber"/>
                          </field>
                        </xsl:when>
                        <xsl:otherwise/>
                </xsl:choose>               
            </import>
        </bapirfc>
    </xsl:template>
</xsl:stylesheet>
