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
            <baseQuantity>
                <xsl:value-of select="/Z_PP_BOM_CREATE/INPUT/IS_BOM_HEADER/BASE_QUAN/text()"/>
            </baseQuantity>
            <baseUnit>
                <xsl:value-of select="/Z_PP_BOM_CREATE/INPUT/IS_BOM_HEADER/BASE_UNIT/text()"/>
            </baseUnit>
            <bomStatus>
                <xsl:value-of select="/Z_PP_BOM_CREATE/INPUT/IS_BOM_HEADER/BOM_STATUS/text()"/>
            </bomStatus>
            <alternateText>
                <xsl:value-of select="/Z_PP_BOM_CREATE/INPUT/IS_BOM_HEADER/ALT_TEXT/text()"/>
            </alternateText>
            <laboratory>
                <xsl:value-of select="/Z_PP_BOM_CREATE/INPUT/IS_BOM_HEADER/LABORATORY/text()"/>
            </laboratory>
            <deleteIndicator>
                <xsl:choose>
                    <xsl:when test="/Z_PP_BOM_CREATE/INPUT/IS_BOM_HEADER/DELETE_IND/text()='X' ">
                        <xsl:value-of select="'true'"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="'false'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </deleteIndicator>
            <bomText>
                <xsl:value-of select="/Z_PP_BOM_CREATE/INPUT/IS_BOM_HEADER/BOM_TEXT/text()"/>
            </bomText>
            <bomGroup>
                <xsl:value-of select="/Z_PP_BOM_CREATE/INPUT/IS_BOM_HEADER/BOM_GROUP/text()"/>
            </bomGroup>
            <authGroup>
                <xsl:value-of select="/Z_PP_BOM_CREATE/INPUT/IS_BOM_HEADER/AUTH_GROUP/text()"/>
            </authGroup>
            <cadIndicator>
                <xsl:choose>
                    <xsl:when test="/Z_PP_BOM_CREATE/INPUT/IS_BOM_HEADER/CAD_IND/text()='X' ">
                        <xsl:value-of select="'true'"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="'false'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </cadIndicator>
            <lifeCycleRelevalent>
                <xsl:choose>
                    <xsl:when test="/Z_PP_BOM_CREATE/INPUT/IS_BOM_HEADER/ZZKZ_LEBENSDAUER/text()='X' ">
                        <xsl:value-of select="'true'"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="'false'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </lifeCycleRelevalent>
            <pssOfficial>
                <xsl:value-of select="/Z_PP_BOM_CREATE/INPUT/IS_BOM_HEADER/ZZ_PSS_BEARB/text()"/>
            </pssOfficial>
            <guid>
                <xsl:value-of select="/Z_PP_BOM_CREATE/INPUT/IS_BOM_HEADER/ID_GUID/text()"/>
            </guid>
            <bomNumber>
                <xsl:value-of select="/Z_PP_BOM_CREATE/OUTPUT/E_BOM_NO/text()"/>
            </bomNumber>
            <aleIndicator>
                <xsl:choose>
                    <xsl:when test="/Z_PP_BOM_CREATE/INPUT/IS_BOM_HEADER/ALE_IND/text()='X' ">
                        <xsl:value-of select="'true'"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="'false'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </aleIndicator>
            <validTo>
                <xsl:value-of select="/Z_PP_BOM_CREATE/INPUT/IS_BOM_HEADER/VALID_TO/text()"/>
            </validTo>
            <changeNumberTo>
                <xsl:value-of select="/Z_PP_BOM_CREATE/INPUT/IS_BOM_HEADER/CHG_NO_TO/text()"/>
            </changeNumberTo>
            <createdOn>
                <xsl:value-of select="/Z_PP_BOM_CREATE/INPUT/IS_BOM_HEADER/CREATED_ON/text()"/>
            </createdOn>
            <createdBy>
                <xsl:value-of select="/Z_PP_BOM_CREATE/INPUT/IS_BOM_HEADER/CREATED_BY/text()"/>
            </createdBy>
            <changedOn>
                <xsl:value-of select="/Z_PP_BOM_CREATE/INPUT/IS_BOM_HEADER/CHANGED_ON/text()"/>
            </changedOn>
            <changedBy>
                <xsl:value-of select="/Z_PP_BOM_CREATE/INPUT/IS_BOM_HEADER/CHANGED_BY/text()"/>
            </changedBy>
            <validFrom>
                <xsl:value-of select="/Z_PP_BOM_CREATE/INPUT/IS_BOM_HEADER/VALID_FROM/text()"/>
            </validFrom>
            <changeNumber>
                <xsl:value-of select="/Z_PP_BOM_CREATE/INPUT/IS_BOM_HEADER/CHG_NO/text()"/>
            </changeNumber>
            <items>
                <xsl:for-each select="/Z_PP_BOM_CREATE/OUTPUT/ET_BOM_ITEM_INSERT/item">
                    <jsonObject>
                        <itemCategory>
                            <xsl:value-of select="./ITEM_CATEG"/>
                        </itemCategory>
                        <itemNumber>
                            <xsl:value-of select="./ITEM_NO"/>
                        </itemNumber>
                        <windchillPartUsageLinkId>
                            <xsl:value-of select="./WTPARTUSAGELINKOBJECTID"/>
                        </windchillPartUsageLinkId>
                        <component>
                            <xsl:value-of select="./COMPONENT"/>
                        </component>
                        <componentQuantity>
                            <xsl:value-of select="./COMP_QTY"/>
                        </componentQuantity>
                        <componentUnit>
                            <xsl:value-of select="./COMP_UNIT"/>
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
                            <xsl:value-of select="./ITEM_TEXT1"/>
                        </itemText1>
                        <itemText2>
                            <xsl:value-of select="./ITEM_TEXT2"/>
                        </itemText2>
                        <sortString>
                            <xsl:value-of select="./SORTSTRING"/>
                        </sortString>
                        <costRelevant>
                            <xsl:value-of select="./REL_COST"/>
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
                            <xsl:value-of select="./SPARE_PART"/>
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
                            <xsl:value-of select="./COMP_SCRAP"/>
                        </componentScrap>
                        <operationScrap>
                            <xsl:value-of select="./OP_SCRAP"/>
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
                            <xsl:value-of select="./DISTR_KEY"/>
                        </distributionKey>
                        <explosionType>
                            <xsl:value-of select="./EXPL_TYPE"/>
                        </explosionType>
                        <specialProcurementType>
                            <xsl:value-of select="./SPPROCTYPE"/>
                        </specialProcurementType>
                        <supplyArea>
                            <xsl:value-of select="./SUPPLYAREA"/>
                        </supplyArea>
                        <issueLocation>
                            <xsl:value-of select="./ISSUE_LOC"/>
                        </issueLocation>
                        <leadTime>
                            <xsl:value-of select="./LEAD_TIME"/>
                        </leadTime>
                        <operationLeadTime>
                            <xsl:value-of select="./OP_LEAD_TM"/>
                        </operationLeadTime>
                        <operationLeadUnit>
                            <xsl:value-of select="./OP_LT_UNIT"/>
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
                            <xsl:value-of select="./DISCON_GRP"/>
                        </discontinuationGroup>
                        <followUpGroup>
                            <xsl:value-of select="./FOLLOW_GRP"/>
                        </followUpGroup>
                        <alternativeGroup>
                            <xsl:value-of select="./AI_GROUP"/>
                        </alternativeGroup>
                        <alternativeStrategy>
                            <xsl:value-of select="./AI_STRATEG"/>
                        </alternativeStrategy>
                        <alternativePriority>
                            <xsl:value-of select="./AI_PRIO"/>
                        </alternativePriority>
                        <usageProbability>
                            <xsl:value-of select="./USAGE_PROB"/>
                        </usageProbability>
                        <referencePoint>
                            <xsl:value-of select="./REFPOINT"/>
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
                            <xsl:value-of select="./COST_ELEM"/>
                        </costElement>
                        <deliveryTime>
                            <xsl:value-of select="./DELIV_TIME"/>
                        </deliveryTime>
                        <groupTime>
                            <xsl:value-of select="./GRP_TIME"/>
                        </groupTime>
                        <materialGroup>
                            <xsl:value-of select="./MAT_GROUP"/>
                        </materialGroup>
                        <price>
                            <xsl:value-of select="./PRICE"/>
                        </price>
                        <priceUnit>
                            <xsl:value-of select="./PRICE_UNIT"/>
                        </priceUnit>
                        <currency>
                            <xsl:value-of select="./CURRENCY"/>
                        </currency>
                        <purchaseGroup>
                            <xsl:value-of select="./PURCH_GRP"/>
                        </purchaseGroup>
                        <purchaseOrganisation>
                            <xsl:value-of select="./PURCH_ORG"/>
                        </purchaseOrganisation>
                        <vendor>
                            <xsl:value-of select="./VENDOR"/>
                        </vendor>
                        <vsiNumber>
                            <xsl:value-of select="./VSI_NO"/>
                        </vsiNumber>
                        <vsiQuantity>
                            <xsl:value-of select="./VSI_QTY"/>
                        </vsiQuantity>
                        <vsiSize1>
                            <xsl:value-of select="./VSI_SIZE1"/>
                        </vsiSize1>
                        <vsiSize2>
                            <xsl:value-of select="./VSI_SIZE2"/>
                        </vsiSize2>
                        <vsiSize3>
                            <xsl:value-of select="./VSI_SIZE3"/>
                        </vsiSize3>
                        <vsiUnit>
                            <xsl:value-of select="./VSI_SZUNIT"/>
                        </vsiUnit>
                        <vsiFormulaKey>
                            <xsl:value-of select="./VSI_SZUNIT"/>
                        </vsiFormulaKey>
                        <document>
                            <xsl:value-of select="./DOCUMENT"/>
                        </document>
                        <documentType>
                            <xsl:value-of select="./DOC_TYPE"/>
                        </documentType>
                        <documentPart>
                            <xsl:value-of select="./DOC_PART"/>
                        </documentPart>
                        <documentVersion>
                            <xsl:value-of select="./DOC_VERS"/>
                        </documentVersion>
                        <class>
                            <xsl:value-of select="./CLASS"/>
                        </class>
                        <classType>
                            <xsl:value-of select="./CLASS_TYPE"/>
                        </classType>
                        <resultingItemCategory>
                            <xsl:value-of select="./RES_ITM_CT"/>
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
                            <xsl:value-of select="./REQD_COMP"/>
                        </requiredComponent>
                        <multiSelectAllowed>
                            <xsl:value-of select="./MULT_SELEC"/>
                        </multiSelectAllowed>
                        <highLevelConfig>
                            <xsl:value-of select="./REL_HLCONF"/>
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
                            <xsl:value-of select="./ITM_IDENT"/>
                        </itemId>
                        <itemGuid>
                            <xsl:value-of select="./ITEM_GUID"/>
                        </itemGuid>
                        <validFrom>
                            <xsl:value-of select="./VALID_FROM"/>
                        </validFrom>
                        <changeNumber>
                            <xsl:value-of select="./CHANGE_NO"/>
                        </changeNumber>
                        <identifier>
                            <xsl:value-of select="./IDENTIFIER"/>
                        </identifier>
                        <unloadingPoint>
                            <xsl:value-of select="./UNLOAD_PT"/>
                        </unloadingPoint>
                        <goodsReceipt>
                            <xsl:value-of select="./GR_RCPT"/>
                        </goodsReceipt>
                        <guid>
                            <xsl:value-of select="./ID_GUID"/>
                        </guid>
                        <segmentValue>
                            <xsl:value-of select="./SEGMENT_VALUE"/>
                        </segmentValue>
                        <lifeCycle>
                            <xsl:value-of select="./ZZLEBENSDAUER"/>
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
                            <xsl:value-of select="./ZZSTLTY"/>
                        </bomCategory>
                        <billOfMaterial>
                            <xsl:value-of select="./ZZSTLNR"/>
                        </billOfMaterial>
                        <bomItemNodeNumber>
                            <xsl:value-of select="./ZZSTLKN"/>
                        </bomItemNodeNumber>
                        <internalCounter>
                            <xsl:value-of select="./ZZSTPOZ"/>
                        </internalCounter>
                        <installedAmount>
                            <xsl:value-of select="./ZZVERBAUT"/>
                        </installedAmount>
                        <recommendedQuantity>
                            <xsl:value-of select="./ZZEMPFOHLENE_M"/>
                        </recommendedQuantity>
                        <reducedBom>
                            <xsl:value-of select="./ZZ_REDUCED_BOM"/>
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
                            <xsl:value-of select="./ZZRSP_OPTION"/>
                        </option>
                        <cleaningClassParticularPC>
                            <xsl:value-of select="./ZPP_CLNGPRCS_PC"/>
                        </cleaningClassParticularPC>
                        <cleaningClassParticularFC>
                            <xsl:value-of select="./ZPP_CLNGPRCS_FC"/>
                        </cleaningClassParticularFC>
                        <cleaningClassParticularVC>
                            <xsl:value-of select="./ZPP_CLNGPRCS_VC"/>
                        </cleaningClassParticularVC>
                        <clnDocumentNumber>
                            <xsl:value-of select="./ZPP_CLNGPRCS_DOKNR"/>
                        </clnDocumentNumber>
                        <clnDocumentType>
                            <xsl:value-of select="./ZPP_CLNGPRCS_DOKAR"/>
                        </clnDocumentType>
                        <clnDocumentVersion>
                            <xsl:value-of select="./ZPP_CLNGPRCS_DOKVR"/>
                        </clnDocumentVersion>
                        <clnDocumentPart>
                            <xsl:value-of select="./ZPP_CLNGPRCS_DOKTL"/>
                        </clnDocumentPart>
                        <cuFactor>
                            <xsl:value-of select="./CUFACTOR"/>
                        </cuFactor>
                        <criticalComponent>
                            <xsl:value-of select="./FSH_CRITICAL_COMP"/>
                        </criticalComponent>
                        <criticalLevel>
                            <xsl:value-of select="./FSH_CRITICAL_LEVEL"/>
                        </criticalLevel>
                        <bomNumber>
                            <xsl:value-of select="./BOM_NO"/>
                        </bomNumber>
                        <itemNodeNumber>
                            <xsl:value-of select="./ITEM_NODE"/>
                        </itemNodeNumber>
                        <itemCount>
                            <xsl:value-of select="./ITEM_COUNT"/>
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
                            <xsl:value-of select="./DEP_LINK"/>
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
                            <xsl:value-of select="./VALID_TO"/>
                        </validTo>
                        <changeNumberTo>
                            <xsl:value-of select="./CHG_NO_TO"/>
                        </changeNumberTo>
                        <createdOn>
                            <xsl:value-of select="./CREATED_ON"/>
                        </createdOn>
                        <createdBy>
                            <xsl:value-of select="./CREATED_BY"/>
                        </createdBy>
                        <changeOn>
                            <xsl:value-of select="./CHANGED_ON"/>
                        </changeOn>
                        <changedBy>
                            <xsl:value-of select="./CHANGED_BY"/>
                        </changedBy>
                        <alternateBom>
                            <xsl:value-of select="./BOM_ALT"/>
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
                    </jsonObject>
                </xsl:for-each>
            </items>
            <backendReturnMessages>
                <xsl:for-each select="/Z_PP_BOM_CREATE/OUTPUT/ET_RETURN_MESSAGES/item">
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
