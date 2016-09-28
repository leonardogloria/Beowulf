<fieldset class="form">
    <div class="form-group  fieldcontain ">
        <label for="name" class="col-md-3 control-label">
            O projeto foi finalizado com sucesso?

            <span class="required-indicator">*</span>

        </label>
        <div class="col-md-7">
            <g:radioGroup class="form-control" name="finishInfo.haveSuccess"
                          labels="['Sim','Não']"
                          values="[true,false]">
                <p>${it.label} ${it.radio}</p>
            </g:radioGroup>
        </div>
    </div>
    <div class="form-group  fieldcontain ">
        <label for="name" class="col-md-3 control-label">
            Deseja escrever algo sobre o projeto?

            <span class="required-indicator">*</span>

        </label>
        <div class="col-md-7">
            <g:textArea name="finishInfo.comment" class="form-control"></g:textArea>
        </div>
    </div>
    <div class="form-group  fieldcontain ">
        <label for="fileName" class="col-md-3 control-label">
            Arquivo:

            <span class="required-indicator">*</span>

        </label>

        <div class="col-md-7">
            <input type="file" name="myFile" id="exampleInputFile">

            <p class="help-block">PDF ou WORD. Esse é o arquivo que ficará disponibilizado como público</p>
        </div>
    </div>



</fieldset>


