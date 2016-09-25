<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
    <title> <g:message message="${entityName}" /></title>
    <g:javascript>
        $(function () {


            $('#autocomplete').autocomplete({
                serviceUrl: '/project/findMembers',
                minChars: 5,
                onSelect: function (suggestion) {
                    $('#addBtn').prop( "disabled", false );
                }
            });

        });

        function addMember() {
            var email = $('#autocomplete').val()
            $('#autocomplete').val('')
            $('#addBtn').prop( "disabled", true );


            $.getJSON("/project/findMembers" + "?query=" + email, function (data) {

                //var rowCount = $('#resultsTable tr').length - 1;
                $.each(data.suggestions, function (i, obj) {
                    var rowCount = $('#resultsTable tr').length - 1;
                    var linha = "<tr id='myTableRow'>"
                    linha += "<td><input type='hidden' name='member' value='" + obj.data + "' >" + obj.firstName + ' ' + obj.lastName + "</td>"
                    linha += "<td>" + obj.value + " </td>"
                    linha += "<td> <button onclick='removeTr($(this));return false' class='btn btn-primary'>Remover</button></td>"

                    linha += "</tr>"
                    $("#resultsTable").append(linha)
                });

            });

                /*
            var linha = "<tr id='myTableRow'>"
            linha += "<td><input type='hidden' name='fatoresgv[" + rowCount + "]' value='" + fator + "' >" + fator + "</td>"
            linha += "<td><input class='escondido' type='hidden' name='lista[" + rowCount + "].subFator' value='" + $("#subFator option:selected").val() + "' >" + subFator + "</td>"
            linha += "<td> <button onclick='removeTr($(this));return false' class='btn btn-primary'>Remover</button></td>"

            linha += "</tr>"
            $("#resultsTable").append(linha)
                    */

        }

        function removeTr(thisobj) {

            thisobj.closest("tr").remove();
            return false;
        }

    </g:javascript>

</head>
<body>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <g:message message="${entityName}" />
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>  <g:message message="${entityName}" /></a></li>
            <li class="active">Novo</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">

        <!-- Default box -->
        <div class="box">
            <div class="box-header with-border">
                <h3 class="box-title">Novo Membro</h3>

            </div>
            <div class="box-body">

                <g:hasErrors bean="${this.project}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${this.project}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </g:hasErrors>

                <g:form action="refreshMembers" id="${project.id}" class="form-horizontal" role="form">
                    <fieldset class="form">

                        <g:render template="formMembers" />
                    </fieldset>
                    <fieldset class="buttons">
                        <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.save.label', default: 'Salvar')}" />
                    </fieldset>
                </g:form>

            </div>
        </div>
    </section>
</div>


</body>

</html>
