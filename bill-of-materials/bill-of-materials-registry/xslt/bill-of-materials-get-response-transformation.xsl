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
            <itemHeaders>
                <xsl:for-each select="/Z_PP_BOM_READ/OUTPUT/ET_BOM_HEADER/item">
                    <jsonObject>
                        <baseQuantity>
                            <xsl:value-of select="normalize-space(./BASE_QUAN/text())"/>
                        </baseQuantity>
                        <baseUnit>
                            <xsl:value-of select="./BASE_UNIT/text()"/>
                        </baseUnit>
                        <bomStatus>
                            <xsl:value-of select="./BOM_STATUS/text()"/>
                        </bomStatus>
                        <alternateText>
                            <xsl:value-of select="./ALT_TEXT/text()"/>
                        </alternateText>
                        <laboratory>
                            <xsl:value-of select="./LABORATORY/text()"/>
                        </laboratory>
                        <deleteIndicator>
                            <xsl:choose>
                                <xsl:when test="./DELETE_IND/text()='X' ">
                                    <xsl:value-of select="'true'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'false'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </deleteIndicator>
                        <bomText>
                            <xsl:value-of select="./BOM_TEXT/text()"/>
                        </bomText>
                        <bomGroup>
                            <xsl:value-of select="./BOM_GROUP/text()"/>
                        </bomGroup>
                        <authGroup>
                            <xsl:value-of select="./AUTH_GROUP/text()"/>
                        </authGroup>
                        <cadIndicator>
                            <xsl:choose>
                                <xsl:when test="./CAD_IND/text()='X' ">
                                    <xsl:value-of select="'true'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'false'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </cadIndicator>
                        <lifeCycleRelevalent>
                            <xsl:choose>
                                <xsl:when test="./ZZKZ_LEBENSDAUER/text()='X' ">
                                    <xsl:value-of select="'true'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'false'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </lifeCycleRelevalent>
                        <pssOfficial>
                            <xsl:value-of select="./ZZ_PSS_BEARB/text()"/>
                        </pssOfficial>
                        <guid>
                            <xsl:value-of select="./ID_GUID/text()"/>
                        </guid>
                        <bomNumber>
                            <xsl:value-of select="./BOM_NO/text()"/>
                        </bomNumber>
                        <aleIndicator>
                            <xsl:choose>
                                <xsl:when test="./ALE_IND/text()='X' ">
                                    <xsl:value-of select="'true'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'false'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </aleIndicator>
                        <validTo>
                            <xsl:value-of select="./VALID_TO/text()"/>
                        </validTo>
                        <changeNumberTo>
                            <xsl:value-of select="./CHG_NO_TO/text()"/>
                        </changeNumberTo>
                        <createdOn>
                            <xsl:value-of select="./CREATED_ON/text()"/>
                        </createdOn>
                        <createdBy>
                            <xsl:value-of select="./CREATED_BY/text()"/>
                        </createdBy>
                        <changedOn>
                            <xsl:value-of select="./CHANGED_ON/text()"/>
                        </changedOn>
                        <changedBy>
                            <xsl:value-of select="./CHANGED_BY/text()"/>
                        </changedBy>
                        <validFrom>
                            <xsl:value-of select="./VALID_FROM/text()"/>
                        </validFrom>
                        <changeNumber>
                            <xsl:value-of select="./CHG_NO/text()"/>
                        </changeNumber>
                        <cleaningClassParticularPC>
                            <xsl:value-of select="./ZPP_CLNGPRCS_PC/text()"/>
                        </cleaningClassParticularPC>
                        <cleaningClassParticularFC>
                            <xsl:value-of select="./ZPP_CLNGPRCS_FC/text()"/>
                        </cleaningClassParticularFC>
                        <cleaningClassParticularVC>
                            <xsl:value-of select="./ZPP_CLNGPRCS_VC/text()"/>
                        </cleaningClassParticularVC>
                    </jsonObject>
                </xsl:for-each>
            </itemHeaders>
            <headerLongTexts>
                <xsl:for-each select="/Z_PP_BOM_READ/OUTPUT/ET_HEADER_LONG_TEXTS/item">
                    <jsonObject>
                        <format>
                            <xsl:value-of select="TDFORMAT" />
                        </format>
                        <line>
                            <xsl:value-of select="TDLINE" />
                        </line>
                    </jsonObject>
                </xsl:for-each>
            </headerLongTexts>
            <items>
                <xsl:for-each select="/Z_PP_BOM_READ/OUTPUT/ET_BOM_ITEM/item">
                    <jsonObject>
                        <itemCategory>
                            <xsl:value-of select="normalize-space(./ITEM_CATEG)"/>
                        </itemCategory>
                        <itemNumber>
                            <xsl:value-of select="normalize-space(./ITEM_NO)"/>
                        </itemNumber>
                        <component>
                            <xsl:value-of select="normalize-space(./COMPONENT)"/>
                        </component>
                        <componentQuantity>
                            <xsl:value-of select="normalize-space(./COMP_QTY)"/>
                        </componentQuantity>
                        <componentUnit>
                            <xsl:value-of select="normalize-space(./COMP_UNIT)"/>
                        </componentUnit>
                        <fixedQuantity>
                            <xsl:choose>
                                <xsl:when test="./FIXED_QTY = 'X'">

                                    <xsl:value-of select="'true'"/>

                                </xsl:when>
                                <xsl:otherwise>

                                    <xsl:value-of select="'false'"/>

                                </xsl:otherwise>
                            </xsl:choose>
                        </fixedQuantity>
                        <itemText1>
                            <xsl:value-of select="normalize-space(./ITEM_TEXT1)"/>
                        </itemText1>
                        <itemText2>
                            <xsl:value-of select="normalize-space(./ITEM_TEXT2)"/>
                        </itemText2>
                        <sortString>
                            <xsl:value-of select="normalize-space(./SORTSTRING)"/>
                        </sortString>
                        <costRelevant>
                            <xsl:value-of select="normalize-space(./REL_COST)"/>
                        </costRelevant>
                        <engineeringRelavent>
                            <xsl:choose>
                                <xsl:when test="./REL_ENGIN='X' ">
                                    <xsl:value-of select="'true'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'false'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </engineeringRelavent>
                        <plantMaintenanceRequired>
                            <xsl:choose>
                                <xsl:when test="./REL_PMAINT='X' ">
                                    <xsl:value-of select="'true'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'false'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </plantMaintenanceRequired>
                        <prodRelevant>
                            <xsl:choose>
                                <xsl:when test="./REL_PROD='X' ">
                                    <xsl:value-of select="'true'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'false'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </prodRelevant>
                        <salesRelavent>
                            <xsl:choose>
                                <xsl:when test="./REL_SALES='X' ">
                                    <xsl:value-of select="'true'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'false'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </salesRelavent>
                        <sparePart>
                            <xsl:value-of select="normalize-space(./SPARE_PART)"/>
                        </sparePart>
                        <matProvisioningRequired>
                            <xsl:choose>
                                <xsl:when test="./MAT_PROVIS='X' ">
                                    <xsl:value-of select="'true'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'false'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </matProvisioningRequired>
                        <bulkMaterial>
                            <xsl:choose>
                                <xsl:when test="./BULK_MAT='X' ">
                                    <xsl:value-of select="'true'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'false'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </bulkMaterial>
                        <recursivenessAllowed>
                            <xsl:choose>
                                <xsl:when test="./REC_ALLOWD='X' ">
                                    <xsl:value-of select="'true'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'false'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </recursivenessAllowed>
                        <componentScrap>
                            <xsl:value-of select="normalize-space(./COMP_SCRAP)"/>
                        </componentScrap>
                        <operationScrap>
                            <xsl:value-of select="normalize-space(./OP_SCRAP)"/>
                        </operationScrap>
                        <netScrap>
                            <xsl:choose>
                                <xsl:when test="./OP_NET_IND='X' ">
                                    <xsl:value-of select="'true'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'false'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </netScrap>
                        <distributionKey>
                            <xsl:value-of select="normalize-space(./DISTR_KEY)"/>
                        </distributionKey>
                        <explosionType>
                            <xsl:value-of select="normalize-space(./EXPL_TYPE)"/>
                        </explosionType>
                        <specialProcurementType>
                            <xsl:value-of select="normalize-space(./SPPROCTYPE)"/>
                        </specialProcurementType>
                        <supplyArea>
                            <xsl:value-of select="normalize-space(./SUPPLYAREA)"/>
                        </supplyArea>
                        <issueLocation>
                            <xsl:value-of select="normalize-space(./ISSUE_LOC)"/>
                        </issueLocation>
                        <leadTime>
                            <xsl:value-of select="normalize-space(./LEAD_TIME)"/>
                        </leadTime>
                        <operationLeadTime>
                            <xsl:value-of select="normalize-space(./OP_LEAD_TM)"/>
                        </operationLeadTime>
                        <operationLeadUnit>
                            <xsl:value-of select="normalize-space(./OP_LT_UNIT)"/>
                        </operationLeadUnit>
                        <coProduct>
                            <xsl:choose>
                                <xsl:when test="./CO_PRODUCT='X' ">
                                    <xsl:value-of select="'true'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'false'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </coProduct>
                        <discontinuationGroup>
                            <xsl:value-of select="normalize-space(./DISCON_GRP)"/>
                        </discontinuationGroup>
                        <followUpGroup>
                            <xsl:value-of select="normalize-space(./FOLLOW_GRP)"/>
                        </followUpGroup>
                        <alternativeGroup>
                            <xsl:value-of select="normalize-space(./AI_GROUP)"/>
                        </alternativeGroup>
                        <alternativeStrategy>
                            <xsl:value-of select="normalize-space(./AI_STRATEG)"/>
                        </alternativeStrategy>
                        <alternativePriority>
                            <xsl:value-of select="normalize-space(./AI_PRIO)"/>
                        </alternativePriority>
                        <usageProbability>
                            <xsl:value-of select="normalize-space(./USAGE_PROB)"/>
                        </usageProbability>
                        <referencePoint>
                            <xsl:value-of select="normalize-space(./REFPOINT)"/>
                        </referencePoint>
                        <pmAssemblyRequired>
                            <xsl:choose>
                                <xsl:when test="./PM_ASSMBLY='X' ">
                                    <xsl:value-of select="'true'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'false'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </pmAssemblyRequired>
                        <costElement>
                            <xsl:value-of select="normalize-space(./COST_ELEM)"/>
                        </costElement>
                        <deliveryTime>
                            <xsl:value-of select="normalize-space(./DELIV_TIME)"/>
                        </deliveryTime>
                        <groupTime>
                            <xsl:value-of select="normalize-space(./GRP_TIME)"/>
                        </groupTime>
                        <materialGroup>
                            <xsl:value-of select="normalize-space(./MAT_GROUP)"/>
                        </materialGroup>
                        <price>
                            <xsl:value-of select="normalize-space(./PRICE)"/>
                        </price>
                        <priceUnit>
                            <xsl:value-of select="normalize-space(./PRICE_UNIT)"/>
                        </priceUnit>
                        <currency>
                            <xsl:value-of select="normalize-space(./CURRENCY)"/>
                        </currency>
                        <purchaseGroup>
                            <xsl:value-of select="normalize-space(./PURCH_GRP)"/>
                        </purchaseGroup>
                        <purchaseOrganisation>
                            <xsl:value-of select="normalize-space(./PURCH_ORG)"/>
                        </purchaseOrganisation>
                        <vendor>
                            <xsl:value-of select="normalize-space(./VENDOR)"/>
                        </vendor>
                        <vsiNumber>
                            <xsl:value-of select="normalize-space(./VSI_NO)"/>
                        </vsiNumber>
                        <vsiQuantity>
                            <xsl:value-of select="normalize-space(./VSI_QTY)"/>
                        </vsiQuantity>
                        <vsiSize1>
                            <xsl:value-of select="normalize-space(./VSI_SIZE1)"/>
                        </vsiSize1>
                        <vsiSize2>
                            <xsl:value-of select="normalize-space(./VSI_SIZE2)"/>
                        </vsiSize2>
                        <vsiSize3>
                            <xsl:value-of select="normalize-space(./VSI_SIZE3)"/>
                        </vsiSize3>
                        <vsiUnit>
                            <xsl:value-of select="normalize-space(./VSI_SZUNIT)"/>
                        </vsiUnit>
                        <vsiFormulaKey>
                            <xsl:value-of select="normalize-space(./VSI_SZUNIT)"/>
                        </vsiFormulaKey>
                        <document>
                            <xsl:value-of select="normalize-space(./DOCUMENT)"/>
                        </document>
                        <documentType>
                            <xsl:value-of select="normalize-space(./DOC_TYPE)"/>
                        </documentType>
                        <documentPart>
                            <xsl:value-of select="normalize-space(./DOC_PART)"/>
                        </documentPart>
                        <documentVersion>
                            <xsl:value-of select="normalize-space(./DOC_VERS)"/>
                        </documentVersion>
                        <class>
                            <xsl:value-of select="normalize-space(./CLASS)"/>
                        </class>
                        <classType>
                            <xsl:value-of select="normalize-space(./CLASS_TYPE)"/>
                        </classType>
                        <resultingItemCategory>
                            <xsl:value-of select="normalize-space(./RES_ITM_CT)"/>
                        </resultingItemCategory>
                        <selectionCondition>
                            <xsl:choose>
                                <xsl:when test="./SEL_COND='X' ">
                                    <xsl:value-of select="'true'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'false'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </selectionCondition>
                        <requiredComponent>
                            <xsl:value-of select="normalize-space(./REQD_COMP)"/>
                        </requiredComponent>
                        <multiSelectAllowed>
                            <xsl:value-of select="normalize-space(./MULT_SELEC)"/>
                        </multiSelectAllowed>
                        <highLevelConfig>
                            <xsl:value-of select="normalize-space(./REL_HLCONF)"/>
                        </highLevelConfig>
                        <cadIndicator>
                            <xsl:choose>
                                <xsl:when test="./CAD_IND='X' ">
                                    <xsl:value-of select="'true'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'false'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </cadIndicator>
                        <itemId>
                            <xsl:value-of select="normalize-space(./ITM_IDENT)"/>
                        </itemId>
                        <itemGuid>
                            <xsl:value-of select="normalize-space(./ITEM_GUID)"/>
                        </itemGuid>
                        <validFrom>
                            <xsl:value-of select="normalize-space(./VALID_FROM)"/>
                        </validFrom>
                        <changeNumber>
                            <xsl:value-of select="normalize-space(./CHANGE_NO)"/>
                        </changeNumber>
                        <identifier>
                            <xsl:variable name="identifierValue" select="normalize-space(./IDENTIFIER)" />
                            <xsl:value-of select="normalize-space(./IDENTIFIER)"/>
                        </identifier>
                        <unloadingPoint>
                            <xsl:value-of select="normalize-space(./UNLOAD_PT)"/>
                        </unloadingPoint>
                        <goodsReceipt>
                            <xsl:value-of select="normalize-space(./GR_RCPT)"/>
                        </goodsReceipt>
                        <segmentValue>
                            <xsl:value-of select="normalize-space(./SEGMENT_VALUE)"/>
                        </segmentValue>
                        <lifeCycle>
                            <xsl:value-of select="normalize-space(./ZZLEBENSDAUER)"/>
                        </lifeCycle>
                        <looseBomPart>
                            <xsl:choose>
                                <xsl:when test="./ZZLOSESTEIL='X' ">
                                    <xsl:value-of select="'true'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'false'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </looseBomPart>
                        <bomCategory>
                            <xsl:value-of select="normalize-space(./ZZSTLTY)"/>
                        </bomCategory>
                        <billOfMaterial>
                            <xsl:value-of select="normalize-space(./ZZSTLNR)"/>
                        </billOfMaterial>
                        <bomItemNodeNumber>
                            <xsl:value-of select="normalize-space(./ZZSTLKN)"/>
                        </bomItemNodeNumber>
                        <internalCounter>
                            <xsl:value-of select="normalize-space(./ZZSTPOZ)"/>
                        </internalCounter>
                        <installedAmount>
                            <xsl:value-of select="normalize-space(./ZZVERBAUT)"/>
                        </installedAmount>
                        <recommendedQuantity>
                            <xsl:value-of select="normalize-space(./ZZEMPFOHLENE_M)"/>
                        </recommendedQuantity>
                        <reducedBom>
                            <xsl:value-of select="normalize-space(./ZZ_REDUCED_BOM)"/>
                        </reducedBom>
                        <recommendedSparePart>
                            <xsl:choose>
                                <xsl:when test="./ZZRSP_ACTIVE='X' ">
                                    <xsl:value-of select="'true'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'false'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </recommendedSparePart>
                        <option>
                            <xsl:value-of select="normalize-space(./ZZRSP_OPTION)"/>
                        </option>
                        <cleaningClassParticularPC>
                            <xsl:value-of select="normalize-space(./ZPP_CLNGPRCS_PC)"/>
                        </cleaningClassParticularPC>
                        <cleaningClassParticularFC>
                            <xsl:value-of select="normalize-space(./ZPP_CLNGPRCS_FC)"/>
                        </cleaningClassParticularFC>
                        <cleaningClassParticularVC>
                            <xsl:value-of select="normalize-space(./ZPP_CLNGPRCS_VC)"/>
                        </cleaningClassParticularVC>
                        <clnDocumentNumber>
                            <xsl:value-of select="normalize-space(./ZPP_CLNGPRCS_DOKNR)"/>
                        </clnDocumentNumber>
                        <clnDocumentType>
                            <xsl:value-of select="normalize-space(./ZPP_CLNGPRCS_DOKAR)"/>
                        </clnDocumentType>
                        <clnDocumentVersion>
                            <xsl:value-of select="normalize-space(./ZPP_CLNGPRCS_DOKVR)"/>
                        </clnDocumentVersion>
                        <clnDocumentPart>
                            <xsl:value-of select="normalize-space(./ZPP_CLNGPRCS_DOKTL)"/>
                        </clnDocumentPart>
                        <cuFactor>
                            <xsl:value-of select="normalize-space(./CUFACTOR)"/>
                        </cuFactor>
                        <criticalComponent>
                            <xsl:value-of select="normalize-space(./FSH_CRITICAL_COMP)"/>
                        </criticalComponent>
                        <criticalLevel>
                            <xsl:value-of select="normalize-space(./FSH_CRITICAL_LEVEL)"/>
                        </criticalLevel>
                        <bomNumber>
                            <xsl:value-of select="normalize-space(./BOM_NO)"/>
                        </bomNumber>
                        <itemNodeNumber>
                            <xsl:value-of select="normalize-space(./ITEM_NODE)"/>
                        </itemNodeNumber>
                        <itemCount>
                            <xsl:value-of select="normalize-space(./ITEM_COUNT)"/>
                        </itemCount>
                        <recursive>
                            <xsl:choose>
                                <xsl:when test="./RECURSIVE='X' ">
                                    <xsl:value-of select="'true'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'false'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </recursive>
                        <dependencyLink>
                            <xsl:value-of select="normalize-space(./DEP_LINK)"/>
                        </dependencyLink>
                        <aleIndicator>
                            <xsl:choose>
                                <xsl:when test="./ALE_IND='X' ">
                                    <xsl:value-of select="'true'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'false'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </aleIndicator>
                        <validTo>
                            <xsl:value-of select="normalize-space(./VALID_TO)"/>
                        </validTo>
                        <changeNumberTo>
                            <xsl:value-of select="normalize-space(./CHG_NO_TO)"/>
                        </changeNumberTo>
                        <createdOn>
                            <xsl:value-of select="normalize-space(./CREATED_ON)"/>
                        </createdOn>
                        <createdBy>
                            <xsl:value-of select="normalize-space(./CREATED_BY)"/>
                        </createdBy>
                        <changeOn>
                            <xsl:value-of select="normalize-space(./CHANGED_ON)"/>
                        </changeOn>
                        <changedBy>
                            <xsl:value-of select="normalize-space(./CHANGED_BY)"/>
                        </changedBy>
                        <alternateBom>
                            <xsl:value-of select="normalize-space(./BOM_ALT)"/>
                        </alternateBom>
                        <deleteIndicator>
                            <xsl:choose>
                                <xsl:when test="./FLDELETE='X' ">
                                    <xsl:value-of select="'true'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'false'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </deleteIndicator>
                        <segmentRelavent>
                            <xsl:choose>
                                <xsl:when test="./SEGMENT_RELEVANT='X' ">
                                    <xsl:value-of select="'true'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'false'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </segmentRelavent>
                        <longTexts>
                            <xsl:for-each select="/Z_PP_BOM_READ/OUTPUT/ET_ITEM_LONG_TEXTS/item[IDENTIFIER=current()/IDENTIFIER]">
                                <jsonObject>
                                    <text>
                                        <objectId>
                                            <xsl:value-of select="OBJECT_ID" />
                                        </objectId>
                                        <identifier>
                                            <xsl:value-of select="IDENTIFIER" />
                                        </identifier>
                                        <bomNumber>
                                            <xsl:value-of select="BOM_NO" />
                                        </bomNumber>
                                        <itemNode>
                                            <xsl:value-of select="ITEM_NODE" />
                                        </itemNode>
                                        <itemCount>
                                            <xsl:value-of select="ITEM_COUNT" />
                                        </itemCount>
                                        <format>
                                            <xsl:value-of select="TDFORMAT" />
                                        </format>
                                        <line>
                                            <xsl:value-of select="TDLINE" />
                                        </line>
                                        <itemGuid>
                                            <xsl:value-of select="ITEM_GUID" />
                                        </itemGuid>
                                    </text>
                                </jsonObject>
                            </xsl:for-each>
                        </longTexts>
                    </jsonObject>
                </xsl:for-each>
            </items>
        </jsonObject>
    </xsl:template>
</xsl:stylesheet>
