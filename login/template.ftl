<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false showAnotherWayIfPresent=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    <#if properties.stylesCommon?has_content>
        <#list properties.stylesCommon?split(' ') as style>
            <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>

<body class="${properties.kcBodyClass!}">
    <div class="${properties.kcLoginClass!}">
        <div class="compsoc-document">
            <header>
                <nav class="navbar navbar-expand-lg navbar-light bg-compsoc sticky-top fixed-top">
                    <div class="container">
                        <a aria-current="page" class="navbar-brand" target="_blank" href="https://computingsociety.co.uk/">
                            <img class="d-inline-block align-top" alt="Computing Society" src="${url.resourcesPath}/img/vertical_padding_light.svg" width="120" height="30">
                        </a>
                    </div>
                </nav>
            </header>

            <main class="main">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-12 col-sm-10 col-md-8">
                            <div class="card my-5">
                                <div class="card-header">
                                    <div class="${properties.kcFormCardClass!}">
                                        <header class="${properties.kcFormHeaderClass!}">
                                            <#if !(auth?has_content && auth.showUsername() && !auth.showResetCredentials())>
                                                <#if displayRequiredFields>
                                                    <div class="${properties.kcContentWrapperClass!}">
                                                        <div class="${properties.kcLabelWrapperClass!} subtitle">
                                                            <span class="subtitle"><span class="required">*</span> ${msg("requiredFields")}</span>
                                                        </div>
                                                        <div class="col-md-10">
                                                            <span id="kc-page-title" class="fs-4"><#nested "header"></span>
                                                        </div>
                                                    </div>
                                                <#else>
                                                    <span id="kc-page-title" class="fs-4"><#nested "header"></span>
                                                </#if>
                                            <#else>
                                                <#if displayRequiredFields>
                                                    <div class="${properties.kcContentWrapperClass!}">
                                                        <div class="${properties.kcLabelWrapperClass!} subtitle">
                                                            <span class="subtitle"><span class="required">*</span> ${msg("requiredFields")}</span>
                                                        </div>
                                                        <div class="col-md-10">
                                                            <#nested "show-username">
                                                            <div id="kc-username" class="${properties.kcFormGroupClass!}">
                                                                <label id="kc-attempted-username">${auth.attemptedUsername}</label>
                                                                <a id="reset-login" href="${url.loginRestartFlowUrl}">
                                                                    <div class="kc-login-tooltip">
                                                                        <i class="${properties.kcResetFlowIcon!}"></i>
                                                                        <span class="kc-tooltip-text">${msg("restartLoginTooltip")}</span>
                                                                    </div>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                <#else>
                                                    <#nested "show-username">
                                                    <div id="kc-username" class="${properties.kcFormGroupClass!}">
                                                        <label id="kc-attempted-username">${auth.attemptedUsername}</label>
                                                        <a id="reset-login" href="${url.loginRestartFlowUrl}">
                                                            <div class="kc-login-tooltip">
                                                                <i class="${properties.kcResetFlowIcon!}"></i>
                                                                <span class="kc-tooltip-text">${msg("restartLoginTooltip")}</span>
                                                            </div>
                                                        </a>
                                                    </div>
                                                </#if>
                                            </#if>
                                            <p class="text-muted m-0">${kcSanitize(msg("loginTitleHtml",(realm.displayNameHtml!'')))?no_esc}</p>
                                        </header>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div id="kc-content">
                                        <div id="kc-content-wrapper">

                                        <#-- App-initiated actions should not see warning messages about the need to complete the action -->
                                        <#-- during login.                                                                               -->
                                        <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                                            <div class="alert alert-${message.type} ${properties.kcAlertClass!} pf-m-<#if message.type = 'error'>danger<#else>${message.type}</#if>">
                                                <#--  <div class="pf-c-alert__icon">
                                                    <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                                                    <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                                                    <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                                                    <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                                                </div>  -->
                                                <span class="${properties.kcAlertTitleClass!}">${kcSanitize(message.summary)?no_esc}</span>
                                            </div>
                                        </#if>

                                        <#nested "form">

                                            <#if auth?has_content && auth.showTryAnotherWayLink() && showAnotherWayIfPresent>
                                                <form id="kc-select-try-another-way-form" action="${url.loginAction}" method="post">
                                                    <div class="${properties.kcFormGroupClass!}">
                                                        <input type="hidden" name="tryAnotherWay" value="on"/>
                                                        <a href="#" id="try-another-way"
                                                        onclick="document.forms['kc-select-try-another-way-form'].submit();return false;">${msg("doTryAnotherWay")}</a>
                                                    </div>
                                                </form>
                                            </#if>

                                        <#if displayInfo>
                                            <div id="kc-info" class="${properties.kcSignUpClass!}">
                                                <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                                                    <#nested "info">
                                                </div>
                                            </div>
                                        </#if>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    ${msg("compsoc-card-footer")}

                                    <#if realm.internationalizationEnabled  && locale.supported?size gt 1>
                                        <hr />

                                        <div class="${properties.kcLocaleMainClass!}" id="kc-locale">
                                            <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                                                <div id="kc-locale-dropdown" class="${properties.kcLocaleDropDownClass!}">
                                                    <button
                                                        id="compsoc-language-dropdown"
                                                        type="button"
                                                        data-bs-toggle="dropdown"
                                                        aria-expanded="false"
                                                        class="${properties.kcButtonClass!} ${properties.kcButtonSecondaryClass!} dropdown-toggle" id="kc-current-locale-link">
                                                            ${locale.current}
                                                        </button>
                                                    <ul class="${properties.kcLocaleListClass!}" aria-labelledby="compsoc-language-dropdown">
                                                        <#list locale.supported as l>
                                                            <li class="${properties.kcLocaleListItemClass!}">
                                                                <a class="${properties.kcLocaleItemClass!}" href="${l.url}">${l.label}</a>
                                                            </li>
                                                        </#list>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </#if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>

            <footer class="footer text-center">
                <span class="footer-text">made with ❤ in Egham</span>
            </footer>
        </div>
    </div>
</body>
</html>
</#macro>
