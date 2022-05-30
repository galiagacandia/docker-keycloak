<#macro mainLayout active bodyClass>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <title>${msg("accountManagementTitle")}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico">
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
  </head>
  <body class="admin-console user ${bodyClass} d-flex flex-column min-vh-100">
    <nav class="offcanvas offcanvas-start show sidenav" tabindex="-1" id="offcanvas" data-mdb-keyboard="false" data-mdb-backdrop="true" data-mdb-scroll="true">
      <div class="sidenav__header">
        <img src="${url.resourcesPath}/img/ruat/logo-ruat.svg" class="sidenav__header__logoruat"/>
        <div class="sidenav__header__usuario">
            <h1 class="sidenav__header__usuario__login" id="usuario"></h1>
        </div>
      </div>
      <div class="offcanvas-body px-0 sidenav__content">
        <div class="sidenav__menu">
            <ul>
                <#if referrer?has_content && referrer.url?has_content><li><a href="${referrer.url}" id="referrer">${msg("backTo",referrer.name)}</a></li></#if>
                
                <li class="<#if active=='account'>active</#if>"><a href="${url.accountUrl}">${msg("account")}</a></li>
                <#if features.passwordUpdateSupported><li class="<#if active=='password'>active</#if>"><a href="${url.passwordUrl}">${msg("password")}</a></li></#if>
                <!-- <li class="<#if active=='totp'>active</#if>"><a href="${url.totpUrl}">${msg("authenticator")}</a></li> -->
                <#if features.identityFederation><li class="<#if active=='social'>active</#if>"><a href="${url.socialUrl}">${msg("federatedIdentity")}</a></li></#if>
                <li class="<#if active=='sessions'>active</#if>"><a href="${url.sessionsUrl}">${msg("sessions")}</a></li>
                <!-- <li class="<#if active=='applications'>active</#if>"><a href="${url.applicationsUrl}">${msg("applications")}</a></li> -->
                <#if features.log><li class="<#if active=='log'>active</#if>"><a href="${url.logUrl}">${msg("log")}</a></li></#if>
                <#if realm.userManagedAccessAllowed && features.authorization><li class="<#if active=='authorization'>active</#if>"><a href="${url.resourceUrl}">${msg("myResources")}</a></li></#if>
            </ul>
        </div>
      </div>
    </nav>
    <main id="container">
        <header class="content__header">
            <div class="content__header__aplicacion">
                <!-- toggler -->
                <button id="sidebarCollapse" data-mdb-toggle="offcanvas" data-mdb-target="#offcanvas" role="button" aria-label="Toggle menu">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </button>
                <h1>Gestión de Cuenta</h1>
                <span class="content__header__aplicacion__version" id="version-aplicacion"></span>
            </div>
            <div class="content__header__entidad">
                <h1 id="entidad"></h1>
                <span class="content__header__fecha" id="fecha"></span>
            </div>
        </header>
        <div class="container-md">
                
            <#if message?has_content>
                <div class="alert alert-${message.type}">
                    <#if message.type=='success' ><span class="pficon pficon-ok"></span></#if>
                    <#if message.type=='error' ><span class="pficon pficon-error-circle-o"></span></#if>
                    <span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span>
                </div>
            </#if>

            <#nested "content">
                
        </div>
      
    </main>
<#if properties.scripts?has_content>
    <#list properties.scripts?split(' ') as script>
        <script type="text/javascript" src="${url.resourcesPath}/${script}"></script>
    </#list>
</#if>

<script>
function getParameterByName(name, url = window.location.href) {
    name = name.replace(/[\[\]]/g, '\\$&');
    var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, ' '));
}
document.getElementById("usuario").innerHTML=getParameterByName("usuario");
document.getElementById("version-aplicacion").innerHTML=getParameterByName("version");
document.getElementById("entidad").innerHTML=getParameterByName("entidad");
document.getElementById("fecha").innerHTML=getParameterByName("fecha");
</script>
  </body>
</html>
</#macro>