<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xml="http://www.w3.org/XML/1998/namespace" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                version="2.0" xsi:schemaLocation="http://www.intershop.com/xml/ns/enfinity/7.1/xcs/impex"
                exclude-result-prefixes="xsi">
    <xsl:param name="ecmNumber"/>

    <xsl:template name="getMessageType">
        <xsl:param name="messageTypeCode"/>
        <xsl:choose>
            <xsl:when test="$messageTypeCode = 'S'">Success</xsl:when>
            <xsl:when test="$messageTypeCode = 'I'">Info</xsl:when>
            <xsl:when test="$messageTypeCode = 'E'">Error</xsl:when>
            <xsl:when test="$messageTypeCode = 'W'">Warning</xsl:when>
            <xsl:when test="$messageTypeCode = 'A'">Abort</xsl:when>
            <xsl:otherwise>Unknown</xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="/">
        <xsl:call-template name="master"/>
    </xsl:template>

    <!-- The master XSLT -->
    <xsl:template name="master">
        <jsonObject>
            <message> <xsl:value-of select="/Z_PP_BOM_EXT_MAT_FOR_PLANT/OUTPUT/ES_RETURN/MESSAGE"/></message>
            <messageNumber> <xsl:value-of select="/Z_PP_BOM_EXT_MAT_FOR_PLANT/OUTPUT/ES_RETURN/NUMBER"/></messageNumber>
            <materialsLog>
                <xsl:for-each select="/Z_PP_BOM_EXT_MAT_FOR_PLANT/OUTPUT/ET_MATERIAL_LOG/item">
                    <jsonObject>
                        <materialNumber>
                            <xsl:value-of select="./MATERIAL_NUMBER"/>
                        </materialNumber>
                        <plant>
                            <xsl:value-of select="./PLANT"/>
                        </plant>
                        <messageType>
                            <xsl:call-template name="getMessageType">
                                <xsl:with-param name="messageTypeCode"  select="./MESSAGE_TYPE"/>
                            </xsl:call-template>
                        </messageType>
                        <message>
                            <xsl:value-of select="./MESSAGE"/>
                        </message>
                    </jsonObject>
                </xsl:for-each>
            </materialsLog>
        </jsonObject>
    </xsl:template>
</xsl:stylesheet>
