<table class="table table-bordered table-condensed machine-table">
    <tr>
        <td colspan="4" width="33.3335%">
            <img class="img-responsive" src="../resources/images/blank.gif"
                 data-echo="../resources/images/products/${machine.photo1}">
        </td>
        <td colspan="8" <c:if test="${!empty machine.photo2}">rowspan="2"</c:if> width="66.6665%">
            <br>

            <h3>${machine.model}</h3><br>
            <h4>
                ${machine.machineTypeEn}<br><br>
                ${machine.brand}, ${machine.producingCountryEn}, ${machine.productionYear}<br><br>
                <spring:message code="machine.location"/>: ${machine.machineLocationEn}<br><br>
                <spring:message code="machine.machineCondition"/>: ${machine.machineConditionEn}<br><br>
                <spring:message code="machine.description"/>: ${machine.descriptionEn}
            </h4>
        </td>
    </tr>
    <c:if test="${!empty machine.photo2}">
    <tr>
        <td colspan="2" width="16.6665%">
            <img class="img-responsive" src="../resources/images/blank.gif"
                 data-echo="../resources/images/products/${machine.photo2}">
        </td>
        <td colspan="2" width="16.6665%">
            <img class="img-responsive" src="../resources/images/blank.gif"
                 data-echo="../resources/images/products/${machine.photo3}">
        </td>
    </tr>
    </c:if>
    <tr>
        <td colspan="3" width="25%"><spring:message code="machine.systemCnc"/></td>
        <td colspan="3" width="25%">${machine.fullSystemCNC}</td>
        <td colspan="3" width="25%"><spring:message code="machine.motion"/> X&timesY&timesZ, <spring:message code="machine.mm"/></td>
        <td colspan="3" width="25%">${machine.xMotion}&times${machine.yMotion}&times${machine.zMotion}</td>
    </tr>
    <tr>
        <td colspan="3" width="25%"><spring:message code="machine.spindleTaper"/></td>
        <td colspan="3" width="25%">${machine.spindleTaper}</td>
        <td colspan="3" width="25%"><spring:message code="machine.tableSize"/>X&timesY, <spring:message code="machine.mm"/></td>
        <td colspan="3" width="25%">${machine.xTableSize}&times${machine.yTableSize}</td>
    </tr>
    <tr>
        <td colspan="3" width="25%"><spring:message code="machine.spindleRotationFrequency"/>, <spring:message code="machine.revMin"/></td>
        <td colspan="3" width="25%">${machine.spindleRotationFreq}</td>
        <td colspan="3" width="25%"><spring:message code="machine.tableLoad"/>, <spring:message code="machine.kg"/></td>
        <td colspan="3" width="25%">${machine.tableLoad}</td>
    </tr>
    <tr>
        <td colspan="3" width="25%"><spring:message code="machine.spindlePower"/>, <spring:message code="machine.kw"/></td>
        <td colspan="3" width="25%">${machine.spindlePower}</td>
        <td colspan="3" width="25%"><spring:message code="machine.toolCount"/>, <spring:message code="machine.pcs"/></td>
        <td colspan="3" width="25%">${machine.toolCount}</td>
    </tr>
    <tr>
        <td colspan="3" width="25%"><spring:message code="machine.toolReplacementTime"/>, <spring:message code="machine.sec"/></td>
        <td colspan="3" width="25%">${machine.toolReplacementTime}</td>
        <td colspan="3" width="25%"><spring:message code="machine.maxToolDiameter"/>, <spring:message code="machine.mm"/></td>
        <td colspan="3" width="25%">${machine.maxToolDiameter}</td>
    </tr>
    <tr>
        <td colspan="3" width="25%"><spring:message code="machine.chipReplacementTime"/>, <spring:message code="machine.sec"/></td>
        <td colspan="3" width="25%">${machine.chipReplacementTime}</td>
        <td colspan="3" width="25%"><spring:message code="machine.maxToolWeight"/>, <spring:message code="machine.kg"/></td>
        <td colspan="3" width="25%">${machine.maxToolWeight}</td>
    </tr>
    <tr>
        <td colspan="3" width="25%"><spring:message code="machine.spindleRuntime"/>, <spring:message code="machine.h"/></td>
        <td colspan="3" width="25%">${machine.spindleRuntime}</td>
        <td colspan="3" width="25%"><spring:message code="machine.maxToolLength"/>, <spring:message code="machine.mm"/></td>
        <td colspan="3" width="25%">${machine.maxToolLength}</td>
    </tr>
    <tr>
        <td colspan="3" width="25%"><spring:message code="machine.positionRepositionPrecision"/>, <spring:message code="machine.mm"/></td>
        <td colspan="3" width="25%">${machine.positionRepositionPrecision}</td>
        <td colspan="3" width="25%"><spring:message code="machine.machineLaunching"/>, <spring:message code="machine.h"/></td>
        <td colspan="3" width="25%">${machine.machineLaunching}</td>
    </tr>
    <tr <c:if test="${pageContext.request.userPrincipal.name == null}">style="display: none"</c:if>>
    <td colspan="6" width="50%"></td>
    <td colspan="3" width="25%"><spring:message code="machine.price"/></td>
    <td colspan="3" width="25%">$${machine.price}</td>
    </tr>
</table>
