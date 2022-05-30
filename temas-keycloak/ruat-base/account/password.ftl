<#import "template.ftl" as layout>
<@layout.mainLayout active='password' bodyClass='password'; section>

    <div class="row titulo-contenido">
        <div class="col-md-10">
            <h2>${msg("changePasswordHtmlTitle")}</h2>
        </div>
        <!-- <div class="col-md-2 subtitle">
            <span class="subtitle">${msg("allFieldsRequired")}</span>
        </div> -->
    </div>
    <div class="contenido-pagina shadow-3">

        <form action="${url.passwordUrl}" method="post">
            <input type="text" id="username" name="username" value="${(account.username!'')}" autocomplete="username" readonly="readonly" style="display:none;">

            <#if password.passwordSet>
                <div class="form-outline mb-4">
                    <input type="password" class="form-control form-control-lg" id="password" name="password" autofocus autocomplete="current-password"/>
                    <label class="form-label" for="password">${msg("password")} <span class="required">*</span></label> 
                </div>
            </#if>

            <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">

            <div class="form-outline mb-4">
                <input type="password" class="form-control form-control-lg" id="password-new" name="password-new" autocomplete="new-password"/>
                <label class="form-label" for="password-new">${msg("passwordNew")} <span class="required">*</span></label> 
            </div>

            <div class="form-outline mb-4">
                <input type="password" class="form-control form-control-lg" id="password-confirm" name="password-confirm" autocomplete="new-password"/>
                <label class="form-label" for="password-confirm">${msg("passwordConfirm")} <span class="required">*</span></label> 
            </div>

            <div class="form-group">
                <div id="kc-form-buttons" class="col-md-offset-2 col-md-12 submit">
                    <div class="ruat-botones">
                        <button type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="submitAction" value="Save">${msg("doSave")}</button>
                        <br style="clear:both"/>
                    </div>
                </div>
            </div>
        </form>
    </div>

</@layout.mainLayout>
