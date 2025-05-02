<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xml="http://www.w3.org/XML/1998/namespace" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                version="2.0" xsi:schemaLocation="http://www.intershop.com/xml/ns/enfinity/7.1/xcs/impex"
                exclude-result-prefixes="xsi">
    <xsl:param name="ecmNumber"/>
    <xsl:template match="/">
        <xsl:call-template name="master"/>
    </xsl:template>
    <!-- The master XSLT -->
    <xsl:template name="master">
        <jsonObject>
            <items>
                <xsl:for-each select="/Z_PP_BOM_CHANGE/OUTPUT/ET_BOM_ITEM_INSERT/item">
                    <jsonObject>
                        <itemCategory>
                            <xsl:value-of select="./ITEM_CATEG"/>
                        </itemCategory>
                        <itemNumber>
                            <xsl:value-of select="./ITEM_NO"/>
                        </itemNumber>
                        <itemNodeNumber>
                            <xsl:value-of select="./ITEM_NODE"/>
                        </itemNodeNumber>
                        <itemCount>
                            <xsl:value-of select="./ITEM_COUNT"/>
                        </itemCount>
                        <windchillPartUsageLinkId>
                            <xsl:value-of select="./WTPARTUSAGELINKOBJECTID"/>
                        </windchillPartUsageLinkId>
                        <itemGuid>
                            <xsl:value-of select="./ITEM_GUID"/>
                        </itemGuid>
                        <guid>
                            <xsl:value-of select="./ID_GUID"/>
                        </guid>
                    </jsonObject>
                </xsl:for-each>
                <xsl:for-each select="/Z_PP_BOM_CHANGE/OUTPUT/ET_BOM_ITEM_UPDATE/item">
                    <jsonObject>
                        <itemCategory>
                            <xsl:value-of select="./ITEM_CATEG"/>
                        </itemCategory>
                        <itemNumber>
                            <xsl:value-of select="./ITEM_NO"/>
                        </itemNumber>
                        <itemNodeNumber>
                            <xsl:value-of select="./ITEM_NODE"/>
                        </itemNodeNumber>
                        <itemCount>
                            <xsl:value-of select="./ITEM_COUNT"/>
                        </itemCount>
                        <windchillPartUsageLinkId>
                            <xsl:value-of select="./WTPARTUSAGELINKOBJECTID"/>
                        </windchillPartUsageLinkId>
                        <itemGuid>
                            <xsl:value-of select="./ITEM_GUID"/>
                        </itemGuid>
                        <guid>
                            <xsl:value-of select="./ID_GUID"/>
                        </guid>
                    </jsonObject>
                </xsl:for-each>
            </items>
            <backendReturnMessages>
                <xsl:for-each select="/Z_PP_BOM_CHANGE/OUTPUT/ET_RETURN_MESSAGES/item">
                    <jsonObject>
                        <type>
                            <xsl:value-of select="./TYPE"/>
                        </type>
                        <id>
                            <xsl:value-of select="./ID"/>
                        </id>
                        <number>
                            <xsl:value-of select="./NUMBER"/>
                        </number>
                        <message>
                            <xsl:value-of select="./MESSAGE"/>
                        </message>
                        <logNumber>
                            <xsl:value-of select="./LOG_NO"/>
                        </logNumber>
                        <logMessageNumber>
                            <xsl:value-of select="./LOG_MSG_NO"/>
                        </logMessageNumber>
                    </jsonObject>
                </xsl:for-each>
            </backendReturnMessages>
        </jsonObject>
    </xsl:template>
</xsl:stylesheet>
