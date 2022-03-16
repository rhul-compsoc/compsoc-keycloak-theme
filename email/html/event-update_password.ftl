<#import "template.ftl" as layout>
<@layout.htmlEmailLayout ; section>
    <#if section = "text">
        ${kcSanitize(msg("eventUpdatePasswordBodyHtml",event.date, event.ipAddress))?no_esc}
    </#if>
    <#if section = "footer">
        ${kcSanitize(msg("eventUpdatePasswordReason"))}
    </#if>
</@layout.htmlEmailLayout>
