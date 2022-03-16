<#import "template.ftl" as layout>
<@layout.htmlEmailLayout ; section>
    <#if section = "text">
        ${kcSanitize(msg("emailVerificationBodyHtml",link, linkExpiration, realmName, linkExpirationFormatter(linkExpiration)))?no_esc}
    </#if>
    <#if section = "footer">
        ${kcSanitize(msg("emailVerificationReason"))}
    </#if>
</@layout.htmlEmailLayout>
