<div class="row">
    <div class="col-md-6">

        <div class="input-group input-group">
            <input placeholder="Digite o email" id="autocomplete" type="text" class="form-control autocomplete-suggestions">
            <span class="input-group-btn">
                <button id="addBtn" type="button" disabled="disabled" onclick="addMember()" class="btn btn-info">Adicionar!</button>
            </span>
        </div>



    </div>
</div>
<br />

<div class="row">

    <div id="loc" class="col-md-12 " style="display: block">

        <table id="resultsTable" class="table table-bordered table-hover">
            <thead>
            <tr>


                <th><g:message code="epi.fabricante.label" default="Nome" /></th>

                <th><g:message code="epi.tipoEpi.label" default="Email" /></th>
                <th><g:message code="epi.tipoEpi.label" default="Opções" /></th>


            </tr>
            </thead>
            <tbody>



            </tbody>

        </table>

    </div><!-- col -->

</div><!-- row -->
