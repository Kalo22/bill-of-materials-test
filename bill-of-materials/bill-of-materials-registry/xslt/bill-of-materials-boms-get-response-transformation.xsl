<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xml="http://www.w3.org/XML/1998/namespace" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                version="2.0" xsi:schemaLocation="http://www.intershop.com/xml/ns/enfinity/7.1/xcs/impex"
                exclude-result-prefixes="xsi">
    <xsl:template match="/">
        <xsl:call-template name="master"/>
    </xsl:template>
    <!-- The master XSLT -->
    <xsl:template name="master">
        <jsonArray>
            <xsl:for-each select="/Z_PP_BOM_QUERY_BY_MATERIAL/OUTPUT/ET_BOM_HEADER/item">
                <jsonObject>
                    <materialNumber>
                        <xsl:value-of select="normalize-space(MATERIAL_NO/text())"/>
                    </materialNumber>
                    <plant>
                        <xsl:value-of select="normalize-space(PLANT/text())"/>
                    </plant>
                    <bomUsage>
                        <xsl:value-of select="normalize-space(BOM_USAGE/text())"/>
                    </bomUsage>
                    <bomInternalNumber>
                        <xsl:value-of select="normalize-space(BOM_INTERNAL_NO/text())"/>
                    </bomInternalNumber>
                    <lotSizeFrom>
                        <xsl:value-of select="normalize-space(LOT_SIZE_FROM/text())"/>
                    </lotSizeFrom>
                    <lotSizeTo>
                        <xsl:value-of select="normalize-space(LOT_SIZE_TO/text())"/>
                    </lotSizeTo>
                    <changedOn>
                        <xsl:value-of select="normalize-space(CHANGED_ON/text())"/>
                    </changedOn>
                    <mvFlag>
                        <xsl:choose>
                            <xsl:when test="MV_FLAG='X' ">
                                <xsl:value-of select="'true'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="'false'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </mvFlag>
                    <bomCategory>
                        <xsl:value-of select="normalize-space(BOM_CATEGORY/text())"/>
                    </bomCategory>
                    <internalCounter>
                        <xsl:value-of select="normalize-space(INTERNAL_COUNTER/text())"/>
                    </internalCounter>
                    <validFrom>
                        <xsl:value-of select="normalize-space(VALID_FROM/text())"/>
                    </validFrom>
                    <technicalStatus>
                        <xsl:value-of select="normalize-space(TECHNICAL_STATUS/text())"/>
                    </technicalStatus>
                    <changeNumber>
                        <xsl:value-of select="normalize-space(CHANGE_NUMBER/text())"/>
                    </changeNumber>
                    <deleteIndicator>
                        <xsl:choose>
                            <xsl:when test="DELETION_INDICATOR='X' ">
                                <xsl:value-of select="'true'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="'false'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </deleteIndicator>
                    <deletionFlag>
                        <xsl:value-of select="normalize-space(DELETION_FLAG/text())"/>
                    </deletionFlag>
                    <headerCounter>
                        <xsl:value-of select="normalize-space(HEADER_COUNTER/text())"/>
                    </headerCounter>
                    <createdOn>
                        <xsl:value-of select="normalize-space(CREATED_ON/text())"/>
                    </createdOn>
                    <createdBy>
                        <xsl:value-of select="normalize-space(CREATED_BY/text())"/>
                    </createdBy>
                    <changedBy>
                        <xsl:value-of select="normalize-space(CHANGED_BY/text())"/>
                    </changedBy>
                    <baseUOM>
                        <xsl:value-of select="normalize-space(BASE_UOM/text())"/>
                    </baseUOM>
                    <baseQuantity>
                        <xsl:value-of select="normalize-space(BASE_QUANTITY/text())"/>
                    </baseQuantity>
                    <cadFlag>
                        <xsl:choose>
                            <xsl:when test="CAD_FLAG='X' ">
                                <xsl:value-of select="'true'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="'false'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </cadFlag>
                    <laboratory>
                        <xsl:value-of select="normalize-space(LABORATORY/text())"/>
                    </laboratory>
                    <longTextLanguage>
                        <xsl:value-of select="normalize-space(LONG_TEXT_LANGUAGE/text())"/>
                    </longTextLanguage>
                    <bomAlternativeText>
                        <xsl:value-of select="normalize-space(BOM_ALTERNATIVE_TEXT/text())"/>
                    </bomAlternativeText>
                    <bomStatus>
                        <xsl:value-of select="normalize-space(BOM_STATUS/text())"/>
                    </bomStatus>
                    <createdInPlant>
                        <xsl:value-of select="normalize-space(CREATED_IN_PLANT/text())"/>
                    </createdInPlant>
                    <lastDateShift>
                        <xsl:value-of select="normalize-space(LAST_DATE_SHIFT/text())"/>
                    </lastDateShift>
                    <lastDateShiftBy>
                        <xsl:value-of select="normalize-space(LAST_DATE_SHIFT_BY/text())"/>
                    </lastDateShiftBy>
                    <lastDateShiftHirarchy>
                        <xsl:value-of select="normalize-space(LAST_DATE_SHIFT_HIERARCHY/text())"/>
                    </lastDateShiftHirarchy>
                    <aleIndicator>
                        <xsl:choose>
                            <xsl:when test="ALE_INDICATOR='X' ">
                                <xsl:value-of select="'true'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="'false'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </aleIndicator>
                    <guid>
                        <xsl:value-of select="normalize-space(GUID/text())"/>
                    </guid>
                    <validTo>
                        <xsl:value-of select="normalize-space(VALID_TO/text())"/>
                    </validTo>
                    <validToRKey>
                        <xsl:value-of select="normalize-space(VALID_TO_RKEY/text())"/>
                    </validToRKey>
                    <ecnTo>
                        <xsl:value-of select="normalize-space(ECN_TO/text())"/>
                    </ecnTo>
                    <ecnToRKey>
                        <xsl:value-of select="normalize-space(ECN_TO_RKEY/text())"/>
                    </ecnToRKey>
                    <lifeCycleRelavent>
                        <xsl:value-of select="normalize-space(ZZKZ_LEBENSDAUER/text())"/>
                    </lifeCycleRelavent>
                    <pssOfficial>
                    <xsl:value-of select="normalize-space(ZZ_PSS_BEARB/text())"/>
                    </pssOfficial>
                    <variantBOM>
                        <xsl:choose>
                            <xsl:when test="VARIANT_BOM='X' ">
                                <xsl:value-of select="'true'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="'false'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </variantBOM>
                    <configurableBOM>
                        <xsl:choose>
                            <xsl:when test="CONFIG_BOM='X' ">
                                <xsl:value-of select="'true'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="'false'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </configurableBOM>
                </jsonObject>
            </xsl:for-each>
        </jsonArray>
    </xsl:template>
</xsl:stylesheet>
