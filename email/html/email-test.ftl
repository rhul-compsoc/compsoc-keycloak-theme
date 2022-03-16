<#import "template.ftl" as layout>
<@layout.htmlEmailLayout ; section>
    <#if section = "text">
        ${kcSanitize(msg("emailTestBodyHtml",realmName))?no_esc}
    </#if>
    <#if section = "footer">
        ${kcSanitize(msg("emailTestReason"))}
    </#if>
</@layout.htmlEmailLayout>
