<#import "template.ftl" as layout>
<@layout.mainLayout active='account' bodyClass='user'; section>
    <div class="row titulo-contenido">
        <div class="col-md-10">
            <!--<h2>${msg("editAccountHtmlTitle")}</h2>-->
            <h2>Cuenta</h2>
        </div>
        <!-- <div class="col-md-2 subtitle">
            <span class="subtitle"><span class="required">*</span> ${msg("requiredFields")}</span>
        </div> -->
    </div>
    <div class="contenido-pagina shadow-3">

        <form action="${url.accountUrl}" method="post">

            <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">

            <#if !realm.registrationEmailAsUsername>
                <div class="form-outline mb-4 ${messagesPerField.printIfExists('username','has-error')}">
                    <input type="text" class="form-control form-control-lg ruat-form-control ruat-form-control--solo-lectura" id="username" name="username" <#if !realm.editUsernameAllowed>disabled="disabled"</#if> value="${(account.username!'')}"/>
                    <label class="form-label" for="username">${msg("username")}</label> <#if realm.editUsernameAllowed><span class="required">*</span></#if>
                </div>
            </#if>
            <!--<div class="form-outline mb-4 ${messagesPerField.printIfExists('email','has-error')}">
                <input type="text" class="form-control form-control-lg" id="email" name="email" autofocus value="${(account.email!'')}"/>
                <label class="form-label" for="email">${msg("email")} <span class="required">*</span></label> 
            </div>

            <div class="form-outline mb-4 ${messagesPerField.printIfExists('firstName','has-error')}">
                <input type="text" class="form-control form-control-lg" id="firstName" name="firstName" value="${(account.firstName!'')}"/>
                <label class="form-label" for="firstName">${msg("firstName")} <span class="required">*</span></label> 
            </div>

            <div class="form-outline mb-4 ${messagesPerField.printIfExists('lastName','has-error')}">
                <input type="text" class="form-control form-control-lg" id="lastName" name="lastName" value="${(account.lastName!'')}"/>
                <label class="form-label" for="lastName">${msg("lastName")} <span class="required">*</span></label> 
            </div>

            <div class="form-group">
                <div id="kc-form-buttons" class="col-md-offset-2 col-md-12 submit">
                    <div class="ruat-botones">
                        <#if url.referrerURI??><a href="${url.referrerURI}">${kcSanitize(msg("backToApplication")?no_esc)}</a></#if>
                        <button type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="submitAction" value="Save">${msg("doSave")}</button>
                        <button type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}" name="submitAction" value="Cancel">${msg("doCancel")}</button>
                    </div>
                </div>
            </div> -->
        </form>
    </div>

</@layout.mainLayout>
