<%@ page import="au.org.ala.webapi.Param; au.org.ala.webapi.Example" %>

<input type="hidden" name="returnTo" value="${params.returnTo}"/>

<div class="fieldcontain ${hasErrors(bean: exampleInstance, field: 'webService', 'error')} required">
    <g:if test="${webService}">
        %{--<g:textField name="webService.name" value="${webService?.name} />--}%
        <g:hiddenField name="webService.id" value="${webService.id}"/>
    </g:if>
    <g:else>
        <label for="webService">
            <g:message code="example.webService.label" default="Web Service"/>
            <span class="required-indicator">*</span>
        </label>
        <g:select id="webService" name="webService.id" from="${au.org.ala.webapi.WebService.list()}" optionKey="id"
                  required="" value="${exampleInstance?.webService?.id}" class="many-to-one"/>
    </g:else>
</div>

<div class="fieldcontain ${hasErrors(bean: exampleInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="example.name.label" default="Name of the example e.g. Search for kangaroo"/>

    </label>
    <g:textField name="name" value="${exampleInstance?.name}" class="input-xxlarge"/>
</div>

<div class="fieldcontain ${hasErrors(bean: exampleInstance, field: 'description', 'error')} ">
    <label for="description">
        <g:message code="example.description.label" default="Description (use markdown if you wish)"/>
    </label>
    <g:textArea name="description" class="input-xxlarge" rows="5" value="${exampleInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: exampleInstance, field: 'urlPath', 'error')} ">
    <label for="urlPath">
        <g:message code="example.urlPath.label" default="URL Path - use this for REST Style URLs that dont use request parameters"/>

    </label>
    <g:textField name="urlPath" class="input-xxlarge" value="${exampleInstance?.urlPath?:''}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: exampleInstance, field: 'onlineViewer', 'error')} ">
    <label for="onlineViewer">
        <g:message code="example.onlineViewer.label" default="Link to a online viewer (e.g. API Kitchen, bl.ocks.org)"/>

    </label>
    <g:textField name="onlineViewer" class="input-xxlarge" value="${exampleInstance?.onlineViewer?:''}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: exampleInstance, field: 'machineCallable', 'error')} ">
    <label for="machineCallable" class="checkbox">
        <g:checkBox name="machineCallable" value="${exampleInstance?.machineCallable}"/>
        <g:message code="example.machineCallable.label" default="Machine callable: Is this example intended for consumption by other software?"/>
    </label>
</div>

<div class="well well-small">

<h3>Parameters

<span class="pull-right">
    <a href="javascript:void(0);" class="btn" id="addRowBtn"><i class="icon-plus"></i>&nbsp;Add&nbsp;parameter</a>
</span>

</h3>
<table class="table">
    <thead id="paramThead" class="${exampleInstance.params ? '' : 'hide'}">
        <th>Name</th>
        <th>Value</th>
        <th></th>
    </thead>
    <tbody id="paramsTBody">
        <g:if test="${exampleInstance.params}">
            <g:each in="${exampleInstance.getSortedParams()}" var="param" status="paramStatus">
                <tr>
                     <g:render template="param" model="[param:param, paramStatus:paramStatus]"/>
                </tr>
            </g:each>
       </g:if>
    </tbody>
</table>

</div>


<r:script>
    $(function(){
        $('#addRowBtn').click(function(){
            var clone = $('#tableTemplate').find('.paramRowTemplate').clone();
            clone.find('.deleteParam').click(function(){
                 $(this).parent().parent().remove();
            });
            $('#paramsTBody').append(clone);
            $('#paramThead').show();
        });

        $('.deleteParam').click(function(){
            $(this).parent().parent().remove();
        });
    })
</r:script>
