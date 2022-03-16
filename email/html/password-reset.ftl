<#import "template.ftl" as layout>
<@layout.htmlEmailLayout ; section>
    <#if section = "text">
        ${msg("passwordResetBodyHtml",link, linkExpiration, realmName, linkExpirationFormatter(linkExpiration))?no_esc}
    </#if>
    <#if section = "footer">
        ${msg("passwordResetReason")}
    </#if>
</@layout.htmlEmailLayout>
