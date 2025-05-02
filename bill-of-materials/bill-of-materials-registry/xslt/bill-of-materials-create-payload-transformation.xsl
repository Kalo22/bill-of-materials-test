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
                <xsl:value-of select="'Z_PP_BOM_CREATE'"/>
            </xsl:attribute>
            <import>
                <field name="I_MATERIAL">
                    <xsl:value-of select="$materialNumber"/>
                </field>
                <field name="I_PLANT">
                    <xsl:value-of select="/jsonObject/plant"/>
                </field>
                <field name="I_BOM_USAGE">
                    <xsl:value-of select="/jsonObject/bomUsage"/>
                </field>
                <field name="I_VALID_FROM">
                    <xsl:value-of select="/jsonObject/validFrom"/>
                </field>
                <field name="I_CHANGE_NO">
                    <xsl:value-of select="/jsonObject/ecmNumber"/>
                </field>
                <field name="I_USERNAME">
                    <xsl:value-of select="/jsonObject/username"/>
                </field>
                <structure>
                    <xsl:attribute name="name">
                        <xsl:value-of select="'IS_BOM_HEADER'"/>
                    </xsl:attribute>
                    <field name="BASE_QUAN">
                        <xsl:value-of select="/jsonObject/baseQuantity"/>
                    </field>
                    <field name="BASE_UNIT">
                        <xsl:value-of select="/jsonObject/baseUnit"/>
                    </field>
                    <field name="BOM_STATUS">
                        <xsl:value-of select="/jsonObject/bomStatus"/>
                    </field>
                    <field name="ALT_TEXT">
                        <xsl:value-of select="/jsonObject/alternateText"/>
                    </field>
                    <field name="LABORATORY">
                        <xsl:value-of select="/jsonObject/laboratory"/>
                    </field>
                    <field name="DELETE_IND">
                        <xsl:value-of select="/jsonObject/deleteIndicator"/>
                    </field>
                    <field name="BOM_TEXT">
                        <xsl:value-of select="/jsonObject/bomText"/>
                    </field>
                    <field name="BOM_GROUP">
                        <xsl:value-of select="/jsonObject/bomGroup"/>
                    </field>
                    <field name="AUTH_GROUP">
                        <xsl:value-of select="/jsonObject/authGroup"/>
                    </field>
                    <field name="CAD_IND">
                        <xsl:value-of select="/jsonObject/cadIndicator"/>
                    </field>
                    <xsl:choose>
                        <xsl:when test="/jsonObject/lifeCycleIndicator != ''">
                            <field name="ZZKZ_LEBENSDAUER">
                                <xsl:if test="/jsonObject/lifeCycleIndicator = 'true'">
                                    <xsl:text>X</xsl:text>
                                </xsl:if>
                            </field>
                        </xsl:when>
                        <xsl:otherwise/>
                    </xsl:choose>
                    <field name="ZZ_PSS_BEARB">
                        <xsl:value-of select="/jsonObject/psOfficial"/>
                    </field>
                    <field name="ID_GUID">
                        <xsl:value-of select="/jsonObject/guid"/>
                    </field>
                </structure>
                <tables>
                    <table>
                        <xsl:attribute name="name">
                            <xsl:value-of select="'IT_BOM_ITEM_INSERT'"/>
                        </xsl:attribute>
                        <xsl:for-each select="/jsonObject/items">
                            <row>
                                <xsl:attribute name="id">
                                    <xsl:value-of
                                            select="position()-1"/>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="./itemCategory != ''">
                                        <field name="ITEM_CATEG">
                                            <xsl:value-of select="./itemCategory"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./itemNumber != ''">
                                        <field name="ITEM_NO">
                                            <xsl:value-of select="./itemNumber"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./windchillPartUsageLinkId != ''">
                                        <field name="WTPARTUSAGELINKOBJECTID">
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
                                        <field name="COMP_QTY">
                                            <xsl:value-of select="./componentQuantity"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./componentUnit != ''">
                                        <field name="COMP_UNIT">
                                            <xsl:value-of select="./componentUnit"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./fixedQuantity != ''">
                                        <field name="FIXED_QTY">
                                            <xsl:if test="./fixedQuantity = 'true'">
                                                <xsl:text>X</xsl:text>
                                            </xsl:if>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./itemText1 != ''">
                                        <field name="ITEM_TEXT1">
                                            <xsl:value-of select="./itemText1"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./itemText2 != ''">
                                        <field name="ITEM_TEXT2">
                                            <xsl:value-of select="./itemText2"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./sortString != ''">
                                        <field name="SORTSTRING">
                                            <xsl:value-of select="./sortString"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <field name="REL_COST">
                                    <xsl:value-of select="./costRelevant"/>
                                </field>
                                <xsl:choose>
                                    <xsl:when test="./engineeringRelavent != ''">
                                        <field name="REL_ENGIN">
                                            <xsl:if test="./engineeringRelavent = 'true'">
                                                <xsl:text>X</xsl:text>
                                            </xsl:if>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./plantMaintenanceRequired != ''">
                                        <field name="REL_PMAINT">
                                            <xsl:if test="./plantMaintenanceRequired = 'true'">
                                                <xsl:text>X</xsl:text>
                                            </xsl:if>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./prodRelevant != ''">
                                        <field name="REL_PROD">
                                            <xsl:if test="./prodRelevant = 'true'">
                                                <xsl:text>X</xsl:text>
                                            </xsl:if>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./salesRelavent != ''">
                                        <field name="REL_SALES">
                                            <xsl:if test="./salesRelavent = 'true'">
                                                <xsl:text>X</xsl:text>
                                            </xsl:if>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <field name="SPARE_PART">
                                    <xsl:value-of select="./sparePart"/>
                                </field>
                                <xsl:choose>
                                    <xsl:when test="./atProvisioningRequired != ''">
                                        <field name="MAT_PROVIS">
                                            <xsl:if test="./atProvisioningRequired = 'true'">
                                                <xsl:text>X</xsl:text>
                                            </xsl:if>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./bulkMaterial != ''">
                                        <field name="BULK_MAT">
                                            <xsl:if test="./bulkMaterial = 'true'">
                                                <xsl:text>X</xsl:text>
                                            </xsl:if>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./recursivenessAllowed != ''">
                                        <field name="REC_ALLOWD">
                                            <xsl:if test="./recursivenessAllowed = 'true'">
                                                <xsl:text>X</xsl:text>
                                            </xsl:if>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./componentScrap != ''">
                                        <field name="COMP_SCRAP">
                                            <xsl:value-of select="./componentScrap"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./operationScrap != ''">
                                        <field name="OP_SCRAP">
                                            <xsl:value-of select="./operationScrap"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./netScrap != ''">
                                        <field name="OP_NET_IND">
                                            <xsl:if test="./netScrap = 'true'">
                                                <xsl:text>X</xsl:text>
                                            </xsl:if>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./distributionKey != ''">
                                        <field name="DISTR_KEY">
                                            <xsl:value-of select="./distributionKey"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./explosionType != ''">
                                        <field name="EXPL_TYPE">
                                            <xsl:value-of select="./explosionType"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./specialProcurementType != ''">
                                        <field name="SPPROCTYPE">
                                            <xsl:value-of select="./specialProcurementType"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./supplyArea != ''">
                                        <field name="SUPPLYAREA">
                                            <xsl:value-of select="./supplyArea"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./issueLocation != ''">
                                        <field name="ISSUE_LOC">
                                            <xsl:value-of select="./issueLocation"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./leadTime != ''">
                                        <field name="LEAD_TIME">
                                            <xsl:value-of select="./leadTime"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./operationLeadTime != ''">
                                        <field name="OP_LEAD_TM">
                                            <xsl:value-of select="./operationLeadTime"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./operationLeadUnit != ''">
                                        <field name="OP_LT_UNIT">
                                            <xsl:value-of select="./operationLeadUnit"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./coProduct != ''">
                                        <field name="CO_PRODUCT">
                                            <xsl:if test="./coProduct = 'true'">
                                                <xsl:text>X</xsl:text>
                                            </xsl:if>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./discontinuationGroup != ''">
                                        <field name="DISCON_GRP">
                                            <xsl:value-of select="./discontinuationGroup"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./followUpGroup != ''">
                                        <field name="FOLLOW_GRP">
                                            <xsl:value-of select="./followUpGroup"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./alternativeGroup != ''">
                                        <field name="AI_GROUP">
                                            <xsl:value-of select="./alternativeGroup"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./alternativeStrategy != ''">
                                        <field name="AI_STRATEG">
                                            <xsl:value-of select="./alternativeStrategy"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./alternativePriority != ''">
                                        <field name="AI_PRIO">
                                            <xsl:value-of select="./alternativePriority"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./usageProbability != ''">
                                        <field name="USAGE_PROB">
                                            <xsl:value-of select="./usageProbability"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./referencePoint != ''">
                                        <field name="REFPOINT">
                                            <xsl:value-of select="./referencePoint"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./pmAssemblyRequired != ''">
                                        <field name="PM_ASSMBLY">
                                            <xsl:if test="./pmAssemblyRequired = 'true'">
                                                <xsl:text>X</xsl:text>
                                            </xsl:if>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./costElement != ''">
                                        <field name="COST_ELEM">
                                            <xsl:value-of select="./costElement"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./deliveryTime != ''">
                                        <field name="DELIV_TIME">
                                            <xsl:value-of select="./deliveryTime"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./groupTime != ''">
                                        <field name="GRP_TIME">
                                            <xsl:value-of select="./groupTime"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./materialGroup != ''">
                                        <field name="MAT_GROUP">
                                            <xsl:value-of select="./materialGroup"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./price != ''">
                                        <field name="PRICE">
                                            <xsl:value-of select="./price"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./priceUnit != ''">
                                        <field name="PRICE_UNIT">
                                            <xsl:value-of select="./priceUnit"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./currency != ''">
                                        <field name="CURRENCY">
                                            <xsl:value-of select="./currency"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./purchaseGroup != ''">
                                        <field name="PURCH_GRP">
                                            <xsl:value-of select="./purchaseGroup"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./purchaseOrganisation != ''">
                                        <field name="PURCH_ORG">
                                            <xsl:value-of select="./purchaseOrganisation"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./vendor != ''">
                                        <field name="VENDOR">
                                            <xsl:value-of select="./vendor"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./vsiNumber != ''">
                                        <field name="VSI_NO">
                                            <xsl:value-of select="./vsiNumber"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./vsiQuantity != ''">
                                        <field name="VSI_QTY">
                                            <xsl:value-of select="./vsiQuantity"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./vsiSize1 != ''">
                                        <field name="VSI_SIZE1">
                                            <xsl:value-of select="./vsiSize1"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./vsiSize2 != ''">
                                        <field name="VSI_SIZE2">
                                            <xsl:value-of select="./vsiSize2"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./vsiSize3 != ''">
                                        <field name="VSI_SIZE3">
                                            <xsl:value-of select="./vsiSize3"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./vsiUnit != ''">
                                        <field name="VSI_SZUNIT">
                                            <xsl:value-of select="./vsiUnit"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./vsiFormulaKey != ''">
                                        <field name="VSI_FORMUL">
                                            <xsl:value-of select="./vsiFormulaKey"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./document != ''">
                                        <field name="DOCUMENT">
                                            <xsl:value-of select="./document"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./documentType != ''">
                                        <field name="DOC_TYPE">
                                            <xsl:value-of select="./documentType"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./documentPart != ''">
                                        <field name="DOC_PART">
                                            <xsl:value-of select="./documentPart"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./documentVersion != ''">
                                        <field name="DOC_VERS">
                                            <xsl:value-of select="./documentVersion"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./class != ''">
                                        <field name="CLASS">
                                            <xsl:value-of select="./class"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./classType != ''">
                                        <field name="CLASS_TYPE">
                                            <xsl:value-of select="./classType"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./resultingItemCategory != ''">
                                        <field name="RES_ITM_CT">
                                            <xsl:value-of select="./resultingItemCategory"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./selectionCondition != ''">
                                        <field name="SEL_COND">
                                            <xsl:if test="./selectionCondition = 'true'">
                                                <xsl:text>X</xsl:text>
                                            </xsl:if>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./requiredComponent != ''">
                                        <field name="REQD_COMP">
                                            <xsl:value-of select="./requiredComponent"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./multiSelectAllowed != ''">
                                        <field name="MULT_SELEC">
                                            <xsl:value-of select="./multiSelectAllowed"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./highLevelConfig != ''">
                                        <field name="REL_HLCONF">
                                            <xsl:value-of select="./highLevelConfig"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./cadIndicator != ''">
                                        <field name="CAD_IND">
                                            <xsl:if test="./cadIndicator = 'true'">
                                                <xsl:text>X</xsl:text>
                                            </xsl:if>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./itemId != ''">
                                        <field name="ITM_IDENT">
                                            <xsl:value-of select="./itemId"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./itemGuid != ''">
                                        <field name="ITEM_GUID">
                                            <xsl:value-of select="./itemGuid"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./validFrom != ''">
                                        <field name="VALID_FROM">
                                            <xsl:value-of select="./validFrom"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./changeNumber != ''">
                                        <field name="CHANGE_NO">
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
                                        <field name="UNLOAD_PT">
                                            <xsl:value-of select="./unloadingPoint"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./goodsReceipt != ''">
                                        <field name="GR_RCPT">
                                            <xsl:value-of select="./goodsReceipt"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./segmentValue != ''">
                                        <field name="SEGMENT_VALUE">
                                            <xsl:value-of select="./segmentValue"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./lifeCycle != ''">
                                        <field name="ZZLEBENSDAUER">
                                            <xsl:value-of select="./lifeCycle"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./looseBomPart != ''">
                                        <field name="ZZLOSESTEIL">
                                            <xsl:if test="./looseBomPart = 'true'">
                                                <xsl:text>X</xsl:text>
                                            </xsl:if>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./bomCategory != ''">
                                        <field name="ZZSTLTY">
                                            <xsl:value-of select="./bomCategory"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./billOfMaterial != ''">
                                        <field name="ZZSTLNR">
                                            <xsl:value-of select="./billOfMaterial"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./bomItemNodeNumber != ''">
                                        <field name="ZZSTLKN">
                                            <xsl:value-of select="./bomItemNodeNumber"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./internalCounter != ''">
                                        <field name="ZZSTPOZ">
                                            <xsl:value-of select="./internalCounter"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./installedAmount != ''">
                                        <field name="ZZVERBAUT">
                                            <xsl:value-of select="./installedAmount"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./recommendedQuantity != ''">
                                        <field name="ZZEMPFOHLENE_M">
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
                                    <xsl:when test="./recommendedSparepart != ''">
                                        <field name="ZZRSP_ACTIVE">
                                            <xsl:if test="./recommendedSparepart = 'true'">
                                                <xsl:text>X</xsl:text>
                                            </xsl:if>
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
                                        <field name="ZPP_CLNGPRCS_PC">
                                            <xsl:value-of select="./cleaningClassParticularPC"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./cleaningClassParticularFC != ''">
                                        <field name="ZPP_CLNGPRCS_FC">
                                            <xsl:value-of select="./cleaningClassParticularFC"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./cleaningClassParticularVC != ''">
                                        <field name="ZPP_CLNGPRCS_VC">
                                            <xsl:value-of select="./cleaningClassParticularVC"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./clnDocumentNumber != ''">
                                        <field name="ZPP_CLNGPRCS_DOKNR">
                                            <xsl:value-of select="./clnDocumentNumber"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./clnDocumentType != ''">
                                        <field name="ZPP_CLNGPRCS_DOKAR">
                                            <xsl:value-of select="./clnDocumentType"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./clnDocumentVersion != ''">
                                        <field name="ZPP_CLNGPRCS_DOKVR">
                                            <xsl:value-of select="./clnDocumentVersion"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./clnDocumentPart != ''">
                                        <field name="ZPP_CLNGPRCS_DOKTL">
                                            <xsl:value-of select="./clnDocumentPart"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./cuFactor != ''">
                                        <field name="CUFACTOR">
                                            <xsl:value-of select="./cuFactor"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./criticalComponent != ''">
                                        <field name="FSH_CRITICAL_COMP">
                                            <xsl:value-of select="./criticalComponent"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./criticalLevel != ''">
                                        <field name="FSH_CRITICAL_LEVEL">
                                            <xsl:value-of select="./criticalLevel"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./bomNumber != ''">
                                        <field name="BOM_NO">
                                            <xsl:value-of select="./bomNumber"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./itemNodeNumber != ''">
                                        <field name="ITEM_NODE">
                                            <xsl:value-of select="./itemNodeNumber"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./itemCount != ''">
                                        <field name="ITEM_COUNT">
                                            <xsl:value-of select="./itemCount"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./recursive != ''">
                                        <field name="RECURSIVE">
                                            <xsl:if test="./recursive = 'true'">
                                                <xsl:text>X</xsl:text>
                                            </xsl:if>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./dependencyLink != ''">
                                        <field name="DEP_LINK">
                                            <xsl:value-of select="./dependencyLink"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./aleIndicator != ''">
                                        <field name="ALE_IND">
                                            <xsl:if test="./aleIndicator = 'true'">
                                                <xsl:text>X</xsl:text>
                                            </xsl:if>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./validTo != ''">
                                        <field name="VALID_TO">
                                            <xsl:value-of select="./validTo"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./changeNumberTo != ''">
                                        <field name="CHG_NO_TO">
                                            <xsl:value-of select="./changeNumberTo"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./createdOn != ''">
                                        <field name="CREATED_ON">
                                            <xsl:value-of select="./createdOn"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./createdBy != ''">
                                        <field name="CREATED_BY">
                                            <xsl:value-of select="./createdBy"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./changeOn != ''">
                                        <field name="CHANGED_ON">
                                            <xsl:value-of select="./changeOn"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./changedBy != ''">
                                        <field name="CHANGED_BY">
                                            <xsl:value-of select="./changedBy"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./alternateBom != ''">
                                        <field name="BOM_ALT">
                                            <xsl:value-of select="./alternateBom"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./deleteIndicator != ''">
                                        <field name="FLDELETE">
                                            <xsl:if test="./deleteIndicator = 'true'">
                                                <xsl:text>X</xsl:text>
                                            </xsl:if>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./segmentRelavent != ''">
                                        <field name="segmentRelavent">
                                            <xsl:if test="./segmentRelavent = 'true'">
                                                <xsl:text>X</xsl:text>
                                            </xsl:if>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./idItemCategory != ''">
                                        <field name="ID_ITM_CTG">
                                            <xsl:value-of select="./idItemCategory"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./idItemNumber != ''">
                                        <field name="ID_ITEM_NO">
                                            <xsl:value-of select="./idItemNumber"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./idComponent != ''">
                                        <field name="ID_COMP">
                                            <xsl:value-of select="./idComponent"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./idClass != ''">
                                        <field name="ID_CLASS">
                                            <xsl:value-of select="./idClass"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./idClassType != ''">
                                        <field name="ID_CL_TYPE">
                                            <xsl:value-of select="./idClassType"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./idDocumentNumber != ''">
                                        <field name="ID_DOC">
                                            <xsl:value-of select="./idDocumentNumber"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./idDocumentType != ''">
                                        <field name="ID_DOC_TYP">
                                            <xsl:value-of select="./idDocumentType"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./idDocumentPart != ''">
                                        <field name="ID_DOC_PRT">
                                            <xsl:value-of select="./idDocumentPart"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./idDocumentVersion != ''">
                                        <field name="ID_DOC_VRS">
                                            <xsl:value-of select="./idDocumentVersion"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./idSort != ''">
                                        <field name="ID_SORT">
                                            <xsl:value-of select="./idSort"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="./guid !=''">
                                        <field name="ID_GUID">
                                            <xsl:value-of select="./guid"/>
                                        </field>
                                    </xsl:when>
                                    <xsl:otherwise/>
                                </xsl:choose>
                            </row>
                        </xsl:for-each>
                    </table>
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
