<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingAPI" value="/api/buildings"/>

<%@ taglib prefix="display" uri="http://displaytag.sf.net" %>

<html>
<head>
    <title>Danh sách toà nhà</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Home</a>
                </li>

                <li>
                    <a href="#">UI &amp; Elements</a>
                </li>
                <li class="active">Content Sliders</li>
            </ul><!-- /.breadcrumb -->
        </div>
        <div class="page-content">
            <div class="page-header">
                <h1>Danh sách toà nhà
                </h1>
            </div><!-- /.page-header -->

            <div class="row">
                <div class="col-xs-12">
                    <div class="widget-box" style="font-family: 'Times New Roman', Times, serif;">
                        <div class="widget-header">
                            <h4 class="widget-title">Tìm kiếm</h4>

                            <span class="widget-toolbar">
											<a href="#" data-action="reload">
												<i class="ace-icon fa fa-refresh"></i>
											</a>

											<a href="#" data-action="collapse">
												<i class="ace-icon fa fa-chevron-up"></i>
											</a>
										</span>
                        </div>

                        <div class="widget-body" style="display: block;">
                            <div class="widget-main">
                                <form:form action="/admin/building-list" modelAttribute="modelSearch" method="GET" id="listForm">
                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-6">
                                                    <label>Tên toà nhàR</label>
<%--                                                    <input type="text" class="form-control" name="name" value="${modelSearch.name}">--%>
                                                    <form:input class="form-control" path="name" />
                                                </div>
                                                <div class="col-xs-6">
                                                    <label>Diện tích sàn</label>
<%--                                                    <input type="number" class="form-control" name="floorArea" value="${modelSearch.floorArea}">--%>
                                                    <form:input class="form-control" path="floorArea" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-2">
                                                    <label>Quận hiện có</label>
<%--                                                    <select class="form-control" name="district">--%>
<%--                                                        <option value="">--Chọn Quận--</option>--%>
<%--                                                        <option value="QUAN_1">Quận 1</option>--%>
<%--                                                        <option value="QUAN_2">Quận 2</option>--%>
<%--                                                        <option value="QUAN_3">Quận 3</option>--%>
<%--                                                    </select>--%>
                                                    <form:select path="district" class="form-control">
                                                        <form:option value="" label="--Chọn Quận--"></form:option>
                                                        <form:options items = "${districtCode}"/>
                                                    </form:select>
                                                </div>
                                                <div class="col-xs-5">
                                                    <label >Phường</label>
<%--                                                    <input type="text" class="form-control" name="ward" value="${modelSearch.ward}">--%>
                                                    <form:input class="form-control" path="ward" />
                                                </div>
                                                <div class="col-xs-5">
                                                    <label>Đường</label>
<%--                                                    <input type="text" class="form-control" name="street" value="${modelSearch.street}">--%>
                                                    <form:input class="form-control" path="street" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-4">
                                                    <label>Số tầng hầm</label>
<%--                                                    <input type="number" class="form-control" name="numberOfBasement" value="${modelSearch.numberOfBasement}">--%>
                                                    <form:input class="form-control" path="numberOfBasement" />
                                                </div>
                                                <div class="col-xs-4">
                                                    <label>Hướng</label>
<%--                                                    <input type="text" class="form-control" name="direction" value="${modelSearch.direction}">--%>
                                                    <form:input class="form-control" path="direction" />
                                                </div>
                                                <div class="col-xs-4">
                                                    <label>Hạng</label>
<%--                                                    <input type="text" class="form-control" name="level" value="${modelSearch.level}">--%>
                                                    <form:input class="form-control" path="level" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-3">
                                                    <label>Diện tích từ</label>
<%--                                                    <input type="number" class="form-control" name="areaFrom" value="${modelSearch.areaFrom}">--%>
                                                    <form:input class="form-control" path="areaFrom" />
                                                </div>
                                                <div class="col-xs-3">
                                                    <label>Diện tích đến</label>
<%--                                                    <input type="number" class="form-control" name="areaTo" value="${modelSearch.areaTo}">--%>
                                                    <form:input class="form-control" path="areaTo" />
                                                </div>
                                                <div class="col-xs-3">
                                                    <label>Giá thuê từ</label>
<%--                                                    <input type="number" class="form-control" name="rentPriceFrom" value="${modelSearch.rentPriceFrom}">--%>
                                                    <form:input class="form-control" path="rentPriceFrom" />
                                                </div>
                                                <div class="col-xs-3">
                                                    <label>Giá thuê đến</label>
<%--                                                    <input type="number" class="form-control" name="rentPriceTo" value="${modelSearch.rentPriceTo}">--%>
                                                    <form:input class="form-control" path="rentPriceTo" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-5">
                                                    <label>Tên quản lý</label>
                                                    <input type="text" class="form-control" name="managerName" value="${modelSearch.managerName}">
                                                </div>
                                                <div class="col-xs-5">
                                                    <label>SĐT quản lý</label>
                                                    <input type="text" class="form-control" name="managerPhone" value="${modelSearch.managerPhone}">
                                                </div>
                                                <div class="col-xs-2">
                                                    <label>Nhân viên phụ trách</label>
<%--                                                    <select class="form-control" name="staffId" value="">--%>
<%--                                                        <option value="">--Chọn nhân viên--</option>--%>
<%--                                                        <option value="1">Nguyen Van A</option>--%>
<%--                                                        <option value="3">Tran Anh Duy</option>--%>
<%--                                                        <option value="4">Pham Van Mach</option>--%>
<%--                                                    </select>--%>
                                                    <form:select path="staffId" class="form-control">
                                                        <form:option value="" label="--Chọn nhân viên--"></form:option>
                                                        <form:options items = "${staffs}"/>
<%--                                                        <form:option value="1" label="Nguyen Van A"></form:option>--%>
<%--                                                        <form:option value="2" label="Tran Anh Duy"></form:option>--%>
<%--                                                        <form:option value="3" label="Pham Van Mach"></form:option>--%>
                                                    </form:select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-6">
                                                    <form:checkboxes path="typeCode" items="${typeCodes}"/>
<%--                                                    <label>--%>
<%--                                                        <input type="checkbox" name="typeCode" value="noi-that">Nội thất--%>
<%--                                                    </label>--%>
<%--                                                    <label>--%>
<%--                                                        <input type="checkbox" name="typeCode" value="tang-tret">Tầng trệt--%>
<%--                                                    </label>--%>
<%--                                                    <label>--%>
<%--                                                        <input type="checkbox" name="typeCode" value="nguyen-can">Nguyên căn--%>
<%--                                                    </label>--%>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-6">
                                                    <button class="btn btn-sm btn-primary" id="btnSearch">
                                                        <i class="ace-icon glyphicon glyphicon-search"></i>
                                                        Tìm kiếm
                                                    </button>
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                </form:form>

                            </div>
                        </div>
                    </div>
                    <div class="pull-right">
                        <a href="/admin/building-edit">
                            <button title="Thêm toà nhà" class="btn btn-primary">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-add" viewBox="0 0 16 16">
                                    <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                    <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                    <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                </svg>
                            </button>
                        </a>

                        <button title="Xoá toà nhà" class="btn btn-danger" id="btnDeleteBuildings">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-dash" viewBox="0 0 16 16">
                                <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                                <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                            </svg>
                        </button>
                    </div>
                </div>
            </div>

            <div class="hr hr-18 dotted hr-double"></div>

            <div class="row" style="font-family: 'Times New Roman', Times, serif;">
                <div class="col-xs-12">
<%--                    truoc khi phan tramng--%>
<%--                    <table id="buildingList" class="table table-striped table-bordered table-hover">--%>
<%--                        <thead>--%>
<%--                        <tr>--%>
<%--                            <th class="center">--%>
<%--                                <label class="pos-rel">--%>
<%--                                    <input type="checkbox" class="ace">--%>
<%--                                    <span class="lbl"></span>--%>
<%--                                </label>--%>
<%--                            </th>--%>
<%--                            <th>Tên toà nhà</th>--%>
<%--                            <th>Địa chỉ</th>--%>
<%--                            <th>Số tầng hầm</th>--%>
<%--                            <th>Tên quản lý</th>--%>
<%--                            <th>SĐT quản lý</th>--%>
<%--                            <th>D.T sàn</th>--%>
<%--                            <th>D.T trống</th>--%>
<%--                            <th>D.T thuê</th>--%>
<%--                            <th>Giá thuê</th>--%>
<%--                            <th>Phí D.V</th>--%>
<%--                            <th>Phí M.G</th>--%>
<%--                            <th>Thao tác</th>--%>
<%--                        </tr>--%>
<%--                        </thead>--%>
<%--                        <tbody>--%>
<%--                        <c:forEach var="item" items="${buildings}">--%>
<%--                            <tr>--%>
<%--                                <td class="center">--%>
<%--                                    <label class="pos-rel">--%>
<%--                                        <input type="checkbox" class="ace" value="${item.id}">--%>
<%--                                        <span class="lbl"></span>--%>
<%--                                    </label>--%>
<%--                                </td>--%>
<%--                                <td>${item.name}</td>--%>
<%--                                <td>${item.address}</td>--%>
<%--                                <td>${item.numberOfBasement}</td>--%>
<%--                                <td>${item.managerName}</td>--%>
<%--                                <td>${item.managerPhone}</td>--%>
<%--                                <td>${item.floorArea}</td>--%>
<%--                                <td></td>--%>
<%--                                <td>${item.rentArea}</td>--%>
<%--                                <td>${item.rentPrice}</td>--%>
<%--                                <td>${item.serviceFee}</td>--%>
<%--                                <td>${item.brokerageFee}</td>--%>
<%--                                <td>--%>
<%--                                    <div>--%>
<%--                                        <button class="btn btn-sm btn-success" title="Giao toà nhà"--%>
<%--                                                onclick="assignmentBuilding(${item.id})">--%>
<%--                                            <i class="ace-icon glyphicon glyphicon-align-justify"></i>--%>
<%--                                        </button>--%>
<%--                                        <a class="btn btn-sm btn-info" title="Sửa toà nhà" href="/admin/building-edit-${item.id}">--%>
<%--                                            <i class="ace-icon fa fa-pencil-square-o"></i>--%>
<%--                                        </a>--%>
<%--                                        <button class="btn btn-sm btn-danger" title="Xoá toà nhà"--%>
<%--                                                onclick="btnDeleteBuilding(${item.id})">--%>
<%--                                            <i class="ace-icon glyphicon glyphicon-trash"></i>--%>
<%--                                        </button>--%>
<%--                                    </div>--%>
<%--                                </td>--%>
<%--                            </tr>--%>

<%--                        </c:forEach>--%>
<%--&lt;%&ndash;                        <div class="col-xs-12">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <div class="table-responsive">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <display:table name="form-group" pagesize="${modelSearch.totalItems}" cellspacing="0" cellpadding="0"&ndash;%&gt;--%>
<%--&lt;%&ndash;                                               sort="external" requestURI="/admin/building-list"&ndash;%&gt;--%>
<%--&lt;%&ndash;                                               partialList="true" size="${modelSearch.totalItems}"&ndash;%&gt;--%>
<%--&lt;%&ndash;                                               id="tableList"&ndash;%&gt;--%>
<%--&lt;%&ndash;                                               export="false"&ndash;%&gt;--%>
<%--&lt;%&ndash;                                               class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"&ndash;%&gt;--%>
<%--&lt;%&ndash;                                               style="margin: 3em 0 1.5em;">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                >&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <display:column headerClass="text-left" property="${modelSearch.name}" title="Tên Toà Nhà"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <display:column property="" title="Địa chỉ" />&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <display:column property="numberOfBasement" title="Số tầng hầm" />&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <display:column property="managerName" title="Tên quản lý" />&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <display:column property="managerPhone" title="SĐT quản lý" />&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <display:column property="floorArea" title="D.T sàn" />&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <display:column property="rentArea" title="D.T thuê" />&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <display:column property="rentPrice" title="Giá thuê" />&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <display:column property="serviceFee" title="Phí D.V" />&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <display:column property="brokerageFee" title="Phí M.G" />&ndash;%&gt;--%>

<%--&lt;%&ndash;                                    <div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <button class="btn btn-sm btn-success" title="Giao toà nhà"&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                onclick="assignmentBuilding(${item.id})">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <i class="ace-icon glyphicon glyphicon-align-justify"></i>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        </button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <a class="btn btn-sm btn-info" title="Sửa toà nhà" href="/admin/building-edit-${item.id}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <i class="ace-icon fa fa-pencil-square-o"></i>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        </a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <button class="btn btn-sm btn-danger" title="Xoá toà nhà"&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                onclick="btnDeleteBuilding(${item.id})">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <i class="ace-icon glyphicon glyphicon-trash"></i>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        </button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <!-- Thêm các cột khác nếu cần -->&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </display:table>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>


<%--                        </tbody>--%>
<%--                    </table>--%>
    <display:table name="buildings" cellspacing="0" cellpadding="0" uid="item"
                   requestURI="/admin/building-list" partialList="true" sort="external"
                   size="${modelSearch.totalItems}" defaultsort="2" defaultorder="ascending"
                   id="tableList" pagesize="${modelSearch.maxPageItems}"
                   export="false"
                   class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                   style="margin: 3em 0 1.5em;">
        <display:column property="name" title="Tên toà nhà" sortable="true" />
        <display:column property="address" title="Địa chỉ" sortable="true" />
        <display:column property="numberOfBasement" title="Số tầng hầm" sortable="true" />
        <display:column property="managerName" title="Tên quản lý" sortable="true" />
        <display:column property="managerPhone" title="SĐT quản lý" sortable="true" />
        <display:column property="floorArea" title="D.T sàn" sortable="true" />
        <display:column property="rentArea" title="D.T thuê" sortable="true" />
        <display:column title="D.T trống" sortable="true" />
        <display:column property="rentPrice" title="Giá thuê" sortable="true" />
        <display:column property="serviceFee" title="Phí D.V" sortable="true" />
        <display:column property="brokerageFee" title="Phí M.G" sortable="true" />
        <display:column title="Thao Tác">
            <div>
                <button class="btn btn-sm btn-success" title="Giao toà nhà"
                        onclick="assignmentBuilding(${tableList.id})">
                    <i class="ace-icon glyphicon glyphicon-align-justify"></i>
                </button>
                <a class="btn btn-sm btn-info" title="Sửa toà nhà" href="/admin/building-edit-${tableList.id}">
                    <i class="ace-icon fa fa-pencil-square-o"></i>
                </a>
                <button class="btn btn-sm btn-danger" title="Xoá toà nhà"
                        onclick="btnDeleteBuilding(${tableList.id})">
                    <i class="ace-icon glyphicon glyphicon-trash"></i>
                </button>
            </div>
        </display:column>



    </display:table>
                </div>
            </div>
        </div><!-- /.row -->
    </div><!-- /.page-content -->
</div>
<div class="modal fade" id="assignmentBuildingModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Danh sách nhân viên</h4>
            </div>
            <div class="modal-body">
                <table class="table table-bordered " id="staffList">
                    <thead>
                    <tr>
                        <th class="center">
                            Chọn
                        </th>
                        <th class="center">Tên nhân viên</th>
                    </tr>
                    </thead>
                    <tbody>
<%--                    <tr>--%>
<%--                        <td class="center">--%>
<%--                            <input type="checkbox" id="checkbox_1" value="1" checked>--%>
<%--                        </td>--%>
<%--                        <td>Nguyễn Văn A</td>--%>
<%--                    </tr>--%>
                    </tbody>
                </table>
                <input type="hidden" id="buildingId" name="buildingId" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnAssignBuilding">Giao toà nhà</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>

<script>
    function assignmentBuilding(buildingId) {
        $('#assignmentBuildingModal').modal();
        $('#buildingId').val(buildingId);
        loadStaffs(buildingId)
    }

    function loadStaffs(buildingId){
        $.ajax({
            type: "GET",
            url: "${buildingAPI}/" + buildingId + "/staffs",
            dataType: "json",
            success: (response) => {
                var row = '';
                $.each(response.data, function (index, item){
                    row += '<tr>';
                    row += '<td class="center"><input type="checkbox" value =' + item.staffId + ' id=checkbox_' + item.staffId + '"  ' + item.checked + '/></td>';
                    row += '<td class="text-center">' + item.fullName + '</td>';
                    row += '</tr>';
                });
                $('#staffList tbody').html(row);
            },
            error: function(response){
                alert("Xoá không thành công");
                console.log(response);
            }
        });
    }

    $('#btnAssignBuilding').click(function(e){
        e.preventDefault();
        var data = {};
        data['buildingId'] = $('#buildingId').val();
        var staffs = $('#staffList').find('tbody input[type=checkbox]:checked').map(function() {
            return $(this).val();
        }).get();
        data['staffs'] = staffs;

        $.ajax({
            type: "PUT",
            url: "${buildingAPI}",
            data: JSON.stringify(data),
            contentType: "application/json",
           // dataType: "text",
            success: () => {
                alert("Giao toà nhà thành công");
            },
            error: function(){
                alert("Giao toà nhà không thành công");
            }
        });
    });

    $('#btnDeleteBuildings').click(function(e) {
        e.preventDefault();
        var data = {};
        var buildingIds = $('#buildingList').find('tbody input[type=checkbox]:checked').map(function() {
            return $(this).val();
        }).get();
        data['ids'] = buildingIds;
        deleteBuilding(data);
    });

    function btnDeleteBuilding(buildingId) {
        var data = {};
        var id = [];
        id = [buildingId]
        data['ids'] = id;
        deleteBuilding(data);
    }

    function deleteBuilding(data) {
        $.ajax({
            type: "DELETE",
            url: "${buildingAPI}",
            data: JSON.stringify(data['ids']),
            contentType: "application/json",
            dataType: "text",
            success: (response) => {
                alert(response);
                window.location.replace("building-list");
            },
            error: function(response){
                alert("Xoá không thành công");
                console.log(response);
            }
        });
    }

    $('#btnSearch').click(function (e) {
        e.preventDefault();
        $('#listForm').submit();
    });
</script>
</body>
</html>
