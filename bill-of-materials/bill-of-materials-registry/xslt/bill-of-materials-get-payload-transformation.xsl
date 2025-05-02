<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xml="http://www.w3.org/XML/1998/namespace" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                version="2.0" xsi:schemaLocation="http://www.intershop.com/xml/ns/enfinity/7.1/xcs/impex"
                exclude-result-prefixes="xsi">
    <xsl:param name="materialNumber"/>
    <xsl:param name="plant"/>
    <xsl:param name="bomUsage"/>
    <xsl:param name="bomAlternative"/>
    <xsl:param name="validFrom"/>
    <xsl:param name="validTo"/>
    <xsl:param name="ecmNumber"/>
    <xsl:template match="/">
        <xsl:call-template name="master"/>
    </xsl:template>
    <!-- The master XSLT -->
    <xsl:template name="master">
        <bapirfc>
            <xsl:attribute name="name">
                <xsl:value-of select="'Z_PP_BOM_READ'"/>
            </xsl:attribute>
            <import>
                <field>
                    <xsl:attribute name="name">
                        <xsl:value-of select="'I_MATERIAL'"/>
                    </xsl:attribute>
                    <xsl:value-of select="$materialNumber"/>
                </field>
                <field>
                    <xsl:attribute name="name">
                        <xsl:value-of select="'I_PLANT'"/>
                    </xsl:attribute>
                    <xsl:value-of select="$plant"/>
                </field>
                <field>
                    <xsl:attribute name="name">
                        <xsl:value-of select="'I_BOM_USAGE'"/>
                    </xsl:attribute>
                    <xsl:value-of select="$bomUsage"/>
                </field>
                <field>
                    <xsl:attribute name="name">
                        <xsl:value-of select="'I_BOM_ALTERNATIVE'"/>
                    </xsl:attribute>
                    <xsl:value-of select="$bomAlternative"/>
                </field>
                <field>
                    <xsl:attribute name="name">
                        <xsl:value-of select="'I_VALID_FROM'"/>
                    </xsl:attribute>
                    <xsl:value-of select="$validFrom"/>
                </field>
                <field>
                    <xsl:attribute name="name">
                        <xsl:value-of select="'I_VALID_TO'"/>
                    </xsl:attribute>
                    <xsl:value-of select="$validTo"/>
                </field>
                <field>
                    <xsl:attribute name="name">
                        <xsl:value-of select="'I_CHANGE_NO'"/>
                    </xsl:attribute>
                    <xsl:value-of select="$ecmNumber"/>
                </field>
            </import>
        </bapirfc>
    </xsl:template>
</xsl:stylesheet>
