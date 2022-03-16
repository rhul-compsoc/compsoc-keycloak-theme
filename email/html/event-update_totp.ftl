<#import "template.ftl" as layout>
<@layout.htmlEmailLayout ; section>
    <#if section = "text">
        ${kcSanitize(msg("eventUpdateTotpBodyHtml",event.date, event.ipAddress))?no_esc}
    </#if>
    <#if section = "footer">
        ${kcSanitize(msg("eventUpdateTotpReason"))}
    </#if>
</@layout.htmlEmailLayout>
