<div class="form-group  fieldcontain ">
    <label for="${property}" class="col-md-3 control-label">
        <g:message message="${property}" />
        <g:if test="${required}">
        <span class="required-indicator">*</span>
        </g:if>
    </label>
    <div class="col-md-7">
        <%= widget %>
    </div>
</div>