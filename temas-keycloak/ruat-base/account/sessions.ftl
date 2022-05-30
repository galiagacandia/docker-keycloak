<#import "template.ftl" as layout>
<@layout.mainLayout active='sessions' bodyClass='sessions'; section>

    <div class="row titulo-contenido">
        <div class="col-md-10">
            <h2>${msg("sessionsHtmlTitle")}</h2>
        </div>
    </div>

    <div class="contenido-pagina shadow-3">
        <table class="table table-striped table-bordered">
            <thead>
            <tr>
                <td>${msg("ip")}</td>
                <td class="ruat-tabla__fecha">${msg("started")}</td>
                <td class="ruat-tabla__fecha">${msg("lastAccess")}</td>
                <td class="ruat-tabla__fecha">${msg("expires")}</td>
                <!-- <td>${msg("clients")}</td> -->
            </tr>
            </thead>

            <tbody>
            <#list sessions.sessions as session>
                <tr>
                    <td>${session.ipAddress}</td>
                    <td class="ruat-tabla__fecha">${session.started?string["dd/MM/yyyy, HH:mm:ss"]}</td>
                    <td class="ruat-tabla__fecha">${session.lastAccess?string["dd/MM/yyyy, HH:mm:ss"]}</td>
                    <td class="ruat-tabla__fecha">${session.expires?string["dd/MM/yyyy, HH:mm:ss"]}</td>
                    <!-- <td>
                        <#list session.clients as client>
                            ${client}<br/>
                        </#list>
                    </td> -->
                </tr>
            </#list>
            </tbody>

        </table>
    
        <form action="${url.sessionsUrl}" method="post">
            <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
            <button id="logout-all-sessions" class="btn btn-default">${msg("doLogOutAllSessions")}</button>
        </form>
    </div>

</@layout.mainLayout>
