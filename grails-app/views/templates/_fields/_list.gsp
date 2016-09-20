<ol class="property-list ${domainClass.propertyName}">
    <g:each in="${domainClass.persistentProperties}" var="p">
        <div class="form-group  fieldcontain">
            <label class="col-md-3 control-label" for="${p.name}">
                <g:message code="cargo.nome.label" default="${p.name}" />
            </label>
            <div class="col-md-7">
                <g:textField disabled="disable" class="form-control" name="${p.name}" required="" value="${body(p)}"/>
            </div>
        </div>

    </g:each>
</ol>


