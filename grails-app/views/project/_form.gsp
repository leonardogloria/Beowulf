<fieldset class="form">
    <div class="form-group  fieldcontain ">
        <label for="name" class="col-md-3 control-label">
            Nome

            <span class="required-indicator">*</span>

        </label>
        <div class="col-md-7">
            <input type="text" class="form-control" name="name" value="" id="name">

        </div>
    </div>

    <div class="form-group  fieldcontain ">
        <label for="description" class="col-md-3 control-label">
            Descrição

        </label>
        <div class="col-md-7">
            <input type="text" class="form-control" name="description" value="" id="description">

        </div>
    </div>
    <div class="form-group  fieldcontain ">
        <label for="description" class="col-md-3 control-label">
            Instituição

        </label>
        <div class="col-md-7">
                <g:select name="institution" optionValue="name" optionKey="id" from="${beowulf.Institution.list()}" class="form-control"></g:select>

            </div>
        </div>



    <div class="form-group  fieldcontain ">
        <label for="startDate" class="col-md-3 control-label">
            Data de Início

        </label>
        <div class="col-md-7">
              <div class="input-group">
                      <div class="input-group-addon">
                        <i class="fa fa-calendar"></i>
                      </div>
            <input data-inputmask="'alias': 'dd/mm/yyyy'" type="text" class="form-control datemask" name="startDate" value="" id="startDate">
                    </div><!-- /.input group -->


        </div>
    </div>
    <div class="form-group  fieldcontain ">
        <label for="endDate" class="col-md-3 control-label">
            Data de Término

        </label>
        <div class="col-md-7">

            <div class="input-group">
                      <div class="input-group-addon">
                        <i class="fa fa-calendar"></i>
                      </div>
                <input data-inputmask="'alias': 'dd/mm/yyyy'" type="text" class="form-control datemask*" name="endDate" value="" id="endDate">
                    </div><!-- /.input group -->


        </div>


    </div>



</fieldset>