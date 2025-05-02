<xsl:stylesheet version="2.0" xsi:schemaLocation="http://www.intershop.com/xml/ns/enfinity/7.1/xcs/impex"
                exclude-result-prefixes="xsi" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:param name="materialNumber"/>
    <xsl:template match="/">
        <xsl:call-template name="master"/>
    </xsl:template>
    <!--The master XSLT-->
    <xsl:template name="master">
        <bapirfc>
            <xsl:attribute name="name">
                <xsl:value-of select="'Z_PP_BOM_CHANGE'"/>
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
                        <xsl:value-of select="'I_BOM_ALTERNATIVE'"/>
                    </xsl:attribute>
                    <xsl:value-of select="/jsonObject/bomAlternative"/>
                </field>
                <field>
                    <xsl:attribute name="name">
                        <xsl:value-of select="'I_PLANT'"/>
                    </xsl:attribute>
                    <xsl:value-of select="/jsonObject/plant"/>
                </field>
                <field>
                    <xsl:attribute name="name">
                        <xsl:value-of select="'I_BOM_USAGE'"/>
                    </xsl:attribute>
                    <xsl:value-of select="/jsonObject/bomUsage"/>
                </field>
                <field>
                    <xsl:attribute name="name">
                        <xsl:value-of select="'I_VALID_FROM'"/>
                    </xsl:attribute>
                    <xsl:value-of select="/jsonObject/validFrom"/>
                </field>
                <field>
                    <xsl:attribute name="name">
                        <xsl:value-of select="'I_CHANGE_NO'"/>
                    </xsl:attribute>
                    <xsl:value-of select="/jsonObject/ecmNumber"/>
                </field>
                <structure>
                    <xsl:attribute name="name">
                        <xsl:value-of select="'IS_BOM_HEADER'"/>
                    </xsl:attribute>
                    <field>
                        <xsl:attribute name="name">
                            <xsl:value-of select="'BASE_QUAN'"/>
                        </xsl:attribute>
                        <xsl:value-of select="/jsonObject/baseQuantity"/>
                    </field>
                    <field>
                        <xsl:attribute name="name">
                            <xsl:value-of select="'BASE_UNIT'"/>
                        </xsl:attribute>
                        <xsl:value-of select="/jsonObject/baseUnit"/>
                    </field>
                    <field>
                        <xsl:attribute name="name">
                            <xsl:value-of select="'BOM_STATUS'"/>
                        </xsl:attribute>
                        <xsl:value-of select="/jsonObject/bomStatus"/>
                    </field>
                    <field>
                        <xsl:attribute name="name">
                            <xsl:value-of select="'ALT_TEXT'"/>
                        </xsl:attribute>
                        <xsl:value-of select="/jsonObject/alternateText"/>
                    </field>
                    <field>
                        <xsl:attribute name="name">
                            <xsl:value-of select="'LABORATORY'"/>
                        </xsl:attribute>
                        <xsl:value-of select="/jsonObject/laboratory"/>
                    </field>
                    <field>
                        <xsl:attribute name="name">
                            <xsl:value-of select="'DELETE_IND'"/>
                        </xsl:attribute>
                        <xsl:value-of select="/jsonObject/deleteIndicator"/>
                    </field>
                    <field>
                        <xsl:attribute name="name">
                            <xsl:value-of select="'BOM_TEXT'"/>
                        </xsl:attribute>
                        <xsl:value-of select="/jsonObject/bomText"/>
                    </field>
                    <field>
                        <xsl:attribute name="name">
                            <xsl:value-of select="'BOM_GROUP'"/>
                        </xsl:attribute>
                        <xsl:value-of select="/jsonObject/bomGroup"/>
                    </field>
                    <field>
                        <xsl:attribute name="name">
                            <xsl:value-of select="'AUTH_GROUP'"/>
                        </xsl:attribute>
                        <xsl:value-of select="/jsonObject/authGroup"/>
                    </field>
                    <field>
                        <xsl:attribute name="name">
                            <xsl:value-of select="'CAD_IND'"/>
                        </xsl:attribute>
                        <xsl:value-of select="/jsonObject/cadIndicator"/>
                    </field>
                    <field>
                        <xsl:attribute name="name">
                            <xsl:value-of
                                    select="'ZZKZ_LEBENSDAUER'"/>
                        </xsl:attribute>
                        <xsl:choose>
                            <xsl:when test="./jsonObject/lifeCycleIndicator = 'true'">
                                <xsl:text>X</xsl:text>
                            </xsl:when>
                            <xsl:otherwise/>
                        </xsl:choose>
                    </field>
                    <field>
                        <xsl:attribute name="name">
                            <xsl:value-of select="'ZZ_PSS_BEARB'"/>
                        </xsl:attribute>
                        <xsl:value-of select="/jsonObject/psOfficial"/>
                    </field>
                    <field>
                        <xsl:attribute name="name">
                            <xsl:value-of select="'ID_GUID'"/>
                        </xsl:attribute>
                        <xsl:value-of select="/jsonObject/guid"/>
                    </field>
                    <field>
                        <xsl:attribute name="name">
                            <xsl:value-of select="'BOM_NO'"/>
                        </xsl:attribute>
                        <xsl:value-of select="/jsonObject/bomNumber"/>
                    </field>
                    <field>
                        <xsl:attribute name="name">
                            <xsl:value-of select="'ALE_IND'"/>
                        </xsl:attribute>
                        <xsl:value-of select="/jsonObject/guid"/>
                    </field>
                    <field>
                        <xsl:attribute name="name">
                            <xsl:value-of select="'VALID_TO'"/>
                        </xsl:attribute>
                        <xsl:value-of select="/jsonObject/validTo"/>
                    </field>
                    <field>
                        <xsl:attribute name="name">
                            <xsl:value-of select="'CHG_NO_TO'"/>
                        </xsl:attribute>
                        <xsl:value-of select="/jsonObject/changeNumberTo"/>
                    </field>
                    <field>
                        <xsl:attribute name="name">
                            <xsl:value-of select="'CREATED_ON'"/>
                        </xsl:attribute>
                        <xsl:value-of select="/jsonObject/createdOn"/>
                    </field>
                    <field>
                        <xsl:attribute name="name">
                            <xsl:value-of select="'CREATED_BY'"/>
                        </xsl:attribute>
                        <xsl:value-of select="/jsonObject/createdBy"/>
                    </field>
                    <field>
                        <xsl:attribute name="name">
                            <xsl:value-of select="'CHANGED_ON'"/>
                        </xsl:attribute>
                        <xsl:value-of select="/jsonObject/changedOn"/>
                    </field>
                    <field>
                        <xsl:attribute name="name">
                            <xsl:value-of select="'CHANGED_BY'"/>
                        </xsl:attribute>
                        <xsl:value-of select="/jsonObject/changedBy"/>
                    </field>
                    <field>
                        <xsl:attribute name="name">
                            <xsl:value-of select="'VALID_FROM'"/>
                        </xsl:attribute>
                        <xsl:value-of select="/jsonObject/validFrom"/>
                    </field>
                    <field>
                        <xsl:attribute name="name">
                            <xsl:value-of select="'CHG_NO'"/>
                        </xsl:attribute>
                        <xsl:value-of select="/jsonObject/headerChangeNumber"/>
                    </field>
                </structure>
                <tables>
                    <xsl:for-each-group select="/jsonObject/items" group-by="operation">
                        <xsl:choose>
                            <xsl:when test="operation!='UN'">
                                <table>
                                    <xsl:choose>
                                        <xsl:when test="operation='N'">
                                            <xsl:attribute name="name">
                                                <xsl:value-of select="'IT_BOM_ITEM_INSERT'"/>
                                            </xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="operation='U'">
                                            <xsl:attribute name="name">
                                                <xsl:value-of select="'IT_BOM_ITEM_UPDATE'"/>
                                            </xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="operation='D'">
                                            <xsl:attribute name="name">
                                                <xsl:value-of select="'IT_BOM_ITEM_DELETE'"/>
                                            </xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="operation='INU'">
                                            <xsl:attribute name="name">
                                                <xsl:value-of select="'IT_BOM_ITEM_NO_CHANGE'"/>
                                            </xsl:attribute>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:for-each select="current-group()">
                                        <xsl:choose>
                                            <xsl:when test="operation='D' or operation='INU' ">
                                                <row>
                                                    <xsl:attribute name="id">
                                                        <xsl:value-of select="position()-1"/>
                                                    </xsl:attribute>
                                                    <xsl:choose>
                                                        <xsl:when test="./itemGuid != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ITEM_GUID'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./itemGuid"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="operation='INU' ">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of select="'WTPARTUSAGELINKOBJECTID'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./windchillPartUsageLinkId"/>
                                                            </field>
                                                        </xsl:when>
                                                    </xsl:choose>
                                                </row>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <row>
                                                    <xsl:attribute name="id">
                                                        <xsl:value-of
                                                                select="position()-1"/>
                                                    </xsl:attribute>
                                                    <xsl:choose>
                                                        <xsl:when test="./itemCategory != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ITEM_CATEG'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./itemCategory"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./itemNumber != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ITEM_NO'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./itemNumber"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./windchillPartUsageLinkId != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'WTPARTUSAGELINKOBJECTID'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./windchillPartUsageLinkId"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="string-length(normalize-space(./component)) = 18">
                                                            <field name="COMPONENT">
                                                                <xsl:value-of select="./component"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:variable name="formattedComponent">
                                                                <xsl:choose>
                                                                    <xsl:when test="./component and string-length(normalize-space(./component)) > 0">
                                                                        <xsl:value-of select="format-number(number(./component), '000000000000000000')"/>
                                                                    </xsl:when>
                                                                </xsl:choose>
                                                            </xsl:variable>
                                                            <xsl:if test="$formattedComponent">
                                                                <field name="COMPONENT">
                                                                    <xsl:value-of select="$formattedComponent"/>
                                                                </field>
                                                            </xsl:if>
                                                            <xsl:if test="not($formattedComponent)">
                                                                <field name="COMPONENT">
                                                                </field>
                                                            </xsl:if>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./componentQuantity != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'COMP_QTY'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./componentQuantity"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./componentUnit != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'COMP_UNIT'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./componentUnit"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./fixedQuantity">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'FIXED_QTY'"/>
                                                                </xsl:attribute>
                                                                <xsl:choose>
                                                                    <xsl:when test="./fixedQuantity = 'true'">
                                                                        <xsl:text>X</xsl:text>
                                                                    </xsl:when>
                                                                    <xsl:otherwise/>
                                                                </xsl:choose>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./itemText1 != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ITEM_TEXT1'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./itemText1"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./itemText2 != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ITEM_TEXT2'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./itemText2"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./sortString != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'SORTSTRING'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./sortString"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./costRelevant != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'REL_COST'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./costRelevant"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./engineeringRelavent">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'REL_ENGIN'"/>
                                                                </xsl:attribute>
                                                                <xsl:choose>
                                                                    <xsl:when test="./engineeringRelavent = 'true'">
                                                                        <xsl:text>X</xsl:text>
                                                                    </xsl:when>
                                                                    <xsl:otherwise/>
                                                                </xsl:choose>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./plantMaintenanceRequired">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'REL_PMAINT'"/>
                                                                </xsl:attribute>
                                                                <xsl:choose>
                                                                    <xsl:when test="./plantMaintenanceRequired = 'true'">
                                                                        <xsl:text>X</xsl:text>
                                                                    </xsl:when>
                                                                    <xsl:otherwise/>
                                                                </xsl:choose>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./prodRelevant">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'REL_PROD'"/>
                                                                </xsl:attribute>
                                                                <xsl:choose>
                                                                    <xsl:when test="./prodRelevant = 'true'">
                                                                        <xsl:text>X</xsl:text>
                                                                    </xsl:when>
                                                                    <xsl:otherwise/>
                                                                </xsl:choose>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./salesRelavent">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'REL_SALES'"/>
                                                                </xsl:attribute>
                                                                <xsl:choose>
                                                                    <xsl:when test="./salesRelavent = 'true'">
                                                                        <xsl:text>X</xsl:text>
                                                                    </xsl:when>
                                                                    <xsl:otherwise/>
                                                                </xsl:choose>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./sparePart != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'SPARE_PART'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./sparePart"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./atProvisioningRequired">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'MAT_PROVIS'"/>
                                                                </xsl:attribute>
                                                                <xsl:choose>
                                                                    <xsl:when test="./atProvisioningRequired = 'true'">
                                                                        <xsl:text>X</xsl:text>
                                                                    </xsl:when>
                                                                    <xsl:otherwise/>
                                                                </xsl:choose>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./bulkMaterial">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'BULK_MAT'"/>
                                                                </xsl:attribute>
                                                                <xsl:choose>
                                                                    <xsl:when test="./bulkMaterial = 'true'">
                                                                        <xsl:text>X</xsl:text>
                                                                    </xsl:when>
                                                                    <xsl:otherwise/>
                                                                </xsl:choose>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./recursivenessAllowed">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'REC_ALLOWD'"/>
                                                                </xsl:attribute>
                                                                <xsl:choose>
                                                                    <xsl:when test="./recursivenessAllowed = 'true'">
                                                                        <xsl:text>X</xsl:text>
                                                                    </xsl:when>
                                                                    <xsl:otherwise/>
                                                                </xsl:choose>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./componentScrap != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'COMP_SCRAP'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./componentScrap"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./operationScrap != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'OP_SCRAP'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./operationScrap"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./netScrap">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'OP_NET_IND'"/>
                                                                </xsl:attribute>
                                                                <xsl:choose>
                                                                    <xsl:when test="./netScrap = 'true'">
                                                                        <xsl:text>X</xsl:text>
                                                                    </xsl:when>
                                                                    <xsl:otherwise/>
                                                                </xsl:choose>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./distributionKey != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'DISTR_KEY'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./distributionKey"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./explosionType != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'EXPL_TYPE'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./explosionType"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./specialProcurementType != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'SPPROCTYPE'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./specialProcurementType"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./supplyArea != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'SUPPLYAREA'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./supplyArea"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./issueLocation != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ISSUE_LOC'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./issueLocation"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./leadTime != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'LEAD_TIME'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./leadTime"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./operationLeadTime != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'OP_LEAD_TM'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./operationLeadTime"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./operationLeadUnit != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'OP_LT_UNIT'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./operationLeadUnit"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./coProduct">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'CO_PRODUCT'"/>
                                                                </xsl:attribute>
                                                                <xsl:choose>
                                                                    <xsl:when test="./coProduct = 'true'">
                                                                        <xsl:text>X</xsl:text>
                                                                    </xsl:when>
                                                                    <xsl:otherwise/>
                                                                </xsl:choose>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./discontinuationGroup != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'DISCON_GRP'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./discontinuationGroup"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./followUpGroup != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'FOLLOW_GRP'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./followUpGroup"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./alternativeGroup != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'AI_GROUP'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./alternativeGroup"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./alternativeStrategy != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'AI_STRATEG'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./alternativeStrategy"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./alternativePriority != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'AI_PRIO'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./alternativePriority"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./usageProbability != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'USAGE_PROB'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./usageProbability"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./referencePoint != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'REFPOINT'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./referencePoint"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./pmAssemblyRequired != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'PM_ASSMBLY'"/>
                                                                </xsl:attribute>
                                                                <xsl:if test="./pmAssemblyRequired = 'true'">
                                                                    <xsl:text>X</xsl:text>
                                                                </xsl:if>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./costElement != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'COST_ELEM'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./costElement"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./deliveryTime != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'DELIV_TIME'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./deliveryTime"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./groupTime != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'GRP_TIME'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./groupTime"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./materialGroup != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'MAT_GROUP'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./materialGroup"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./price != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'PRICE'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./price"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./priceUnit != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'PRICE_UNIT'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./priceUnit"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./currency != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'CURRENCY'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./currency"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./purchaseGroup != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'PURCH_GRP'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./purchaseGroup"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./purchaseOrganisation != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'PURCH_ORG'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./purchaseOrganisation"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./vendor != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'VENDOR'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./vendor"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./vsiNumber != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'VSI_NO'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./vsiNumber"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./vsiQuantity != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'VSI_QTY'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./vsiQuantity"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./vsiSize1 != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'VSI_SIZE1'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./vsiSize1"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./vsiSize2 != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'VSI_SIZE2'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./vsiSize2"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./vsiSize3 != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'VSI_SIZE3'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./vsiSize3"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./vsiUnit != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'VSI_SZUNIT'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./vsiUnit"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./vsiFormulaKey != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'VSI_FORMUL'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./vsiFormulaKey"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./document != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'DOCUMENT'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./document"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./documentType != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'DOC_TYPE'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./documentType"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./documentPart != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'DOC_PART'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./documentPart"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./documentVersion != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'DOC_VERS'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./documentVersion"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./class != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'CLASS'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./class"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./classType != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'CLASS_TYPE'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./classType"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./resultingItemCategory != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'RES_ITM_CT'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./resultingItemCategory"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./selectionCondition">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'SEL_COND'"/>
                                                                </xsl:attribute>
                                                                <xsl:choose>
                                                                    <xsl:when test="./selectionCondition = 'true'">
                                                                        <xsl:text>X</xsl:text>
                                                                    </xsl:when>
                                                                    <xsl:otherwise/>
                                                                </xsl:choose>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./requiredComponent != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'REQD_COMP'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./requiredComponent"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./multiSelectAllowed != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'MULT_SELEC'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./multiSelectAllowed"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./highLevelConfig != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'REL_HLCONF'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./highLevelConfig"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./cadIndicator">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'CAD_IND'"/>
                                                                </xsl:attribute>
                                                                <xsl:choose>
                                                                    <xsl:when test="./cadIndicator = 'true'">
                                                                        <xsl:text>X</xsl:text>
                                                                    </xsl:when>
                                                                    <xsl:otherwise/>
                                                                </xsl:choose>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./itemId != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ITM_IDENT'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./itemId"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./itemGuid != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ITEM_GUID'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./itemGuid"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./validFrom != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'VALID_FROM'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./validFrom"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./changeNumber != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'CHANGE_NO'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./changeNumber"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <field name="IDENTIFIER">
                                                        <xsl:value-of select="./windchillPartUsageLinkId"/>
                                                    </field>
                                                    <xsl:choose>
                                                        <xsl:when test="./unloadingPoint != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'UNLOAD_PT'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./unloadingPoint"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./goodsReceipt != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'GR_RCPT'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./goodsReceipt"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./segmentValue != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'SEGMENT_VALUE'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./segmentValue"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./lifeCycle != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ZZLEBENSDAUER'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./lifeCycle"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./looseBomPart != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ZZLOSESTEIL'"/>
                                                                </xsl:attribute>
                                                                <xsl:if test="./looseBomPart = 'true'">
                                                                    <xsl:text>X</xsl:text>
                                                                </xsl:if>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./bomCategory != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ZZSTLTY'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./bomCategory"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./billOfMaterial != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ZZSTLNR'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./billOfMaterial"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./bomItemNodeNumber != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ZZSTLKN'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./bomItemNodeNumber"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./internalCounter != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ZZSTPOZ'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./internalCounter"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./installedAmount != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ZZVERBAUT'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./installedAmount"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./recommendedQuantity != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ZZEMPFOHLENE_M'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./recommendedQuantity"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./reducedBom != ''">
                                                            <field name="ZZ_REDUCED_BOM">
                                                                <xsl:value-of select="./reducedBom"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./recommendedSparepart">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ZZRSP_ACTIVE'"/>
                                                                </xsl:attribute>
                                                                <xsl:choose>
                                                                    <xsl:when test="./recommendedSparepart = 'true'">
                                                                        <xsl:text>X</xsl:text>
                                                                    </xsl:when>
                                                                    <xsl:otherwise/>
                                                                </xsl:choose>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./option != ''">
                                                            <field name="ZZRSP_OPTION">
                                                                <xsl:if test="./option = 'true'">
                                                                    <xsl:text>X</xsl:text>
                                                                </xsl:if>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./cleaningClassParticularPC != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ZPP_CLNGPRCS_PC'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./cleaningClassParticularPC"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./cleaningClassParticularFC != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ZPP_CLNGPRCS_FC'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./cleaningClassParticularFC"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./cleaningClassParticularVC != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ZPP_CLNGPRCS_VC'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./cleaningClassParticularVC"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./clnDocumentNumber != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ZPP_CLNGPRCS_DOKNR'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./clnDocumentNumber"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./clnDocumentType != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ZPP_CLNGPRCS_DOKAR'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./clnDocumentType"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./clnDocumentVersion != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ZPP_CLNGPRCS_DOKVR'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./clnDocumentVersion"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./clnDocumentPart != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ZPP_CLNGPRCS_DOKTL'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./clnDocumentPart"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./cuFactor != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'CUFACTOR'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./cuFactor"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./criticalComponent != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'FSH_CRITICAL_COMP'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./criticalComponent"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./criticalLevel != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'FSH_CRITICAL_LEVEL'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./criticalLevel"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./bomNumber != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'BOM_NO'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./bomNumber"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./itemNodeNumber != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ITEM_NODE'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./itemNodeNumber"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./itemCount != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ITEM_COUNT'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./itemCount"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./recursive">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'RECURSIVE'"/>
                                                                </xsl:attribute>
                                                                <xsl:choose>
                                                                    <xsl:when test="./recursive = 'true'">
                                                                        <xsl:text>X</xsl:text>
                                                                    </xsl:when>
                                                                    <xsl:otherwise/>
                                                                </xsl:choose>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./dependencyLink != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'DEP_LINK'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./dependencyLink"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./aleIndicator">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ALE_IND'"/>
                                                                </xsl:attribute>
                                                                <xsl:choose>
                                                                    <xsl:when test="./aleIndicator = 'true'">
                                                                        <xsl:text>X</xsl:text>
                                                                    </xsl:when>
                                                                    <xsl:otherwise/>
                                                                </xsl:choose>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./validTo != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'VALID_TO'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./validTo"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./changeNumberTo != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'CHG_NO_TO'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./changeNumberTo"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./createdOn != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'CREATED_ON'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./createdOn"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./createdBy != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'CREATED_BY'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./createdBy"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./changeOn != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'CHANGED_ON'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./changeOn"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./changedBy != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'CHANGED_BY'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./changedBy"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./alternateBom != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'BOM_ALT'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./alternateBom"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./deleteIndicator">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'FLDELETE'"/>
                                                                </xsl:attribute>
                                                                <xsl:choose>
                                                                    <xsl:when test="./deleteIndicator = 'true'">
                                                                        <xsl:text>X</xsl:text>
                                                                    </xsl:when>
                                                                    <xsl:otherwise/>
                                                                </xsl:choose>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./segmentRelavent">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'SEGMENT_RELEVANT'"/>
                                                                </xsl:attribute>
                                                                <xsl:choose>
                                                                    <xsl:when test="./segmentRelavent = 'true'">
                                                                        <xsl:text>X</xsl:text>
                                                                    </xsl:when>
                                                                    <xsl:otherwise/>
                                                                </xsl:choose>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./idItemCategory != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ID_ITM_CTG'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./idItemCategory"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./idItemNumber != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ID_ITEM_NO'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./idItemNumber"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./idComponent != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ID_COMP'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./idComponent"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./idClass != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ID_CLASS'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./idClass"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./idClassType != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ID_CL_TYPE'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./idClassType"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./idDocumentNumber != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ID_DOC'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./idDocumentNumber"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./idDocumentType != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ID_DOC_TYP'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./idDocumentType"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./idDocumentPart != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ID_DOC_PRT'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./idDocumentPart"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./idDocumentVersion != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ID_DOC_VRS'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./idDocumentVersion"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./idSort != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ID_SORT'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./idSort"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise/>
                                                    </xsl:choose>
                                                    <xsl:choose>
                                                        <xsl:when test="./guid != ''">
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ID_GUID'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./guid"/>
                                                            </field>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <field>
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of
                                                                            select="'ID_GUID'"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="./itemGuid"/>
                                                            </field>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </row>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:for-each>
                                </table>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each-group>
                </tables>
                <tables>
                    <table>
                        <xsl:attribute name="name">
                            <xsl:value-of select="'IT_ITEM_LONG_TEXTS'"/>
                        </xsl:attribute>
                        <xsl:for-each select="/jsonObject/items/longTexts">
                            <row>
                                <xsl:attribute name="id">
                                    <xsl:value-of
                                            select="position()-1"/>
                                </xsl:attribute>
                                <field name="OBJECT_ID">2</field>
                                <field name="IDENTIFIER">
                                    <xsl:value-of select=".././windchillPartUsageLinkId"/>
                                </field>
                                <field name="TDFORMAT"><xsl:value-of select="./format"/></field>
                                <field name="TDLINE"><xsl:value-of select="./line"/></field>
                            </row>
                        </xsl:for-each>
                    </table>
                </tables>
                <tables>
                    <table>
                        <xsl:attribute name="name">
                            <xsl:value-of select="'IT_HEADER_LONG_TEXTS'"/>
                        </xsl:attribute>
                        <xsl:for-each select="/jsonObject/headerLongTexts">
                            <row>
                                <xsl:attribute name="id">
                                    <xsl:value-of
                                            select="position()-1"/>
                                </xsl:attribute>
                                <field name="TDFORMAT"><xsl:value-of select="./format"/></field>
                                <field name="TDLINE"><xsl:value-of select="./line"/></field>
                            </row>
                        </xsl:for-each>
                    </table>
                </tables>
            </import>
        </bapirfc>
    </xsl:template>
</xsl:stylesheet>