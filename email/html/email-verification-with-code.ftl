<#import "template.ftl" as layout>
<@layout.htmlEmailLayout ; section>
    <#if section = "text">
        ${kcSanitize(msg("emailVerificationBodyCodeHtml",code))?no_esc}
    </#if>
    <#if section = "footer">
        ${kcSanitize(msg("emailVerificationBodyCodeReason"))}
    </#if>
</@layout.htmlEmailLayout>
