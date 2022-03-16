<#import "template.ftl" as layout>
<@layout.htmlEmailLayout ; section>
    <#if section = "text">
        ${kcSanitize(msg("identityProviderLinkBodyHtml", identityProviderAlias, realmName, identityProviderContext.username, link, linkExpiration, linkExpirationFormatter(linkExpiration)))?no_esc}
    </#if>
    <#if section = "footer">
        ${kcSanitize(msg("identityProviderLinkReason"))}
    </#if>
</@layout.htmlEmailLayout>
