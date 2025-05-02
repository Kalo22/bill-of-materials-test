<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xml="http://www.w3.org/XML/1998/namespace" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                version="2.0" xsi:schemaLocation="http://www.intershop.com/xml/ns/enfinity/7.1/xcs/impex"
                exclude-result-prefixes="xsi">
    <xsl:param name="materialNumber"/>
    <xsl:template match="/">
        <xsl:call-template name="master"/>
    </xsl:template>
    <!-- The master XSLT -->
    <xsl:template name="master">
        <bapirfc>
            <xsl:attribute name="name">
                <xsl:value-of select="'Z_PP_BOM_EXT_MAT_FOR_PLANT'"/>
            </xsl:attribute>
            <import>
                <field name="I_MATERIAL_OF_BOM">
                    <xsl:value-of select="$materialNumber"/>
                </field>
                <field name="I_BOM_USAGE">
                    <xsl:value-of select="/jsonObject/bomUsage"/>
                </field>
                <field name="I_BOM_ALTERNATIVE">
                    <xsl:value-of select="/jsonObject/bomAlternative"/>
                </field>
                <field name="I_VALID_FROM">
                    <xsl:value-of select="/jsonObject/validFrom"/>
                </field>
                <field name="I_CHANGE_NO">
                    <xsl:value-of select="/jsonObject/ecmNumber"/>
                </field>
                <tables>
                    <table>
                        <xsl:attribute name="name">
                            <xsl:value-of select="'IT_MATERIALS_TO_EXT'"/>
                        </xsl:attribute>
                        <xsl:for-each select="/jsonObject/materialNumbers">
                            <row>
                                <xsl:attribute name="id">
                                    <xsl:value-of
                                            select="position()-1"/>
                                </xsl:attribute>
                            <field name="MATERIAL_NUMBER">
                                    <xsl:value-of select="."/>
                             </field>
                            </row>
                        </xsl:for-each>
                    </table>
                </tables>
            </import>
        </bapirfc>
    </xsl:template>
</xsl:stylesheet>
