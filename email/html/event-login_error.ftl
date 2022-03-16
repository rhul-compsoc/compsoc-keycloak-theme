<#import "template.ftl" as layout>
<@layout.htmlEmailLayout ; section>
    <#if section = "text">
        ${kcSanitize(msg("eventLoginErrorBodyHtml",event.date,event.ipAddress))?no_esc}
    </#if>
    <#if section = "footer">
        ${kcSanitize(msg("eventLoginErrorReason"))}
    </#if>
</@layout.htmlEmailLayout>
