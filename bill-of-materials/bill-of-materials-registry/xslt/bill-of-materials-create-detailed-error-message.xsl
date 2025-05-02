<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs" version="2.0">
    <xsl:param name="type"/>
    <xsl:template match="/">
        <xsl:variable name="detailedErrorMessage" select="''"/>
        <xsl:choose>
            <xsl:when test="$type='create' ">
                <jsonObject>
                    <detailedErrorMessage>
                        <xsl:for-each select="//Z_PP_BOM_CREATE/OUTPUT/ET_RETURN_MESSAGES/item">
                            <jsonObject>
                                <errorMessage>
                                    <xsl:value-of select="./MESSAGE/text()"/>
                                </errorMessage>
                                <errorCode>
                                    <xsl:value-of select="./NUMBER/text()"/>
                                </errorCode>
                                <errorClass>
                                    <xsl:value-of select="./ID/text()"/>
                                </errorClass>
                            </jsonObject>
                        </xsl:for-each>
                    </detailedErrorMessage>
                </jsonObject>
            </xsl:when>
            <xsl:when test="$type='extend-material-for-plant' ">
                <jsonObject>
                    <xsl:if test="count(/Z_PP_BOM_EXT_MAT_FOR_PLANT/OUTPUT/ET_ADDITIONAL_ERR_MSGS/item) &gt; 0">
                        <detailedErrorMessage>
                            <xsl:for-each select="//Z_PP_BOM_EXT_MAT_FOR_PLANT/OUTPUT/ET_ADDITIONAL_ERR_MSGS/item">
                                <jsonObject>
                                    <errorMessage>
                                        <xsl:value-of select="."/>
                                    </errorMessage>
                                </jsonObject>
                            </xsl:for-each>
                        </detailedErrorMessage>
                    </xsl:if>
                </jsonObject>
            </xsl:when>
            <xsl:otherwise>
                <detailedErrorMessage>
                    <xsl:for-each select="//Z_PP_BOM_CHANGE/OUTPUT/ET_RETURN_MESSAGES/item">
                        <jsonObject>
                            <errorMessage>
                                <xsl:value-of select="./MESSAGE/text()"/>
                            </errorMessage>
                            <errorCode>
                                <xsl:value-of select="./NUMBER/text()"/>
                            </errorCode>
                            <errorClass>
                                <xsl:value-of select="./ID/text()"/>
                            </errorClass>
                        </jsonObject>
                    </xsl:for-each>
                </detailedErrorMessage>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>