<#import "template.ftl" as layout>
<@layout.htmlEmailLayout ; section>
    <#if section = "text">
        ${kcSanitize(msg("eventRemoveTotpBodyHtml",event.date, event.ipAddress))?no_esc}
    </#if>
    <#if section = "footer">
        ${kcSanitize(msg("eventRemoveTotpReason"))}
    </#if>
</@layout.htmlEmailLayout>
