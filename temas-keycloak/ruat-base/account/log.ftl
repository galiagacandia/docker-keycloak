<#import "template.ftl" as layout>
<@layout.mainLayout active='log' bodyClass='log'; section>

    <div class="row titulo-contenido">
        <div class="col-md-10">
            <h2>${msg("accountLogHtmlTitle")}</h2>
        </div>
    </div>

    <div class="contenido-pagina shadow-3">
        <table class="table table-striped table-bordered">
            <thead>
            <tr>
                <td class="ruat-tabla__fecha">${msg("date")}</td>
                <td>${msg("event")}</td>
                <td>${msg("ip")}</td>
                <td>${msg("client")}</td>
                <td>${msg("details")}</td>
            </tr>
            </thead>

            <tbody>
            <#list log.events as event>
                <tr>
                    <td class="ruat-tabla__fecha">${event.date?string["dd/MM/yyyy, HH:mm:ss"]}</td>
                    <td>${event.event}</td>
                    <td>${event.ipAddress}</td>
                    <td>${event.client!}</td>
                    <td><#list event.details as detail>${detail.key} = ${detail.value} <#if detail_has_next>, </#if></#list></td>
                </tr>
            </#list>
            </tbody>

        </table>
    </div>

</@layout.mainLayout>