<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingEditURL" value="/admin/building-edit"/>
<html>
<head>
    <title>Thông tin toà nhà</title>
</head>
<body>
<div class="main-content" id="main-content">
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
                <h1>Thông tin toà nhà
                </h1>
            </div><!-- /.page-header -->

            <div class="row" style="font-family: 'Times New Roman', Times, serif;">
                <form:form modelAttribute="buildingEdit" action="${buildingEditURL}" method="get" id="form-edit">
                    <div class="col-xs-12">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label class="col-xs-3" >Tên toà nhà</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="text" name="name">--%>
                                    <form:input path="name" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Quận</label>
                                <div class="col-xs-4">
                                    <form:select path="district" class="form-control">
                                        <form:option value="" label="--Chọn Quận--"></form:option>
                                        <form:options items = "${districtCode}"/>
                                    </form:select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Phường</label>
                                <div class="col-xs-9">
                                    <form:input path="ward" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3" >Đường</label>
                                <div class="col-xs-9">
                                    <form:input path="street" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3" >Kết cấu</label>
                                <div class="col-xs-9">
                                    <form:input path="structure" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3" >Số tầng hầm</label>
                                <div class="col-xs-9">
                                    <form:input path="numberOfBasement" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Diện tích sàn</label>
                                <div class="col-xs-9">
                                    <form:input path="floorArea" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Hướng</label>
                                <div class="col-xs-9">
                                    <form:input path="direction" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Hạng</label>
                                <div class="col-xs-9">
                                    <form:input path="level" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Diện tích thuê</label>
                                <div class="col-xs-9">
                                    <form:input path="rentArea" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Giá thuê</label>
                                <div class="col-xs-9">
                                    <form:input path="rentPrice" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Mô tả giá</label>
                                <div class="col-xs-9">
                                    <form:input path="rentPriceDescription" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Phí dịch vụ</label>
                                <div class="col-xs-9">
                                    <form:input path="serviceFee" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Phí ô tô</label>
                                <div class="col-xs-9">
                                    <form:input path="carFee" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Phí mô tô</label>
                                <div class="col-xs-9">
                                    <form:input path="motoFee" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Phí ngoài giờ</label>
                                <div class="col-xs-9">
                                    <form:input path="overtimeFee" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Tiền điện</label>
                                <div class="col-xs-9">
                                    <form:input path="electricityFee" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Đặt cọc</label>
                                <div class="col-xs-9">
                                    <form:input path="deposit" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Thanh toán</label>
                                <div class="col-xs-9">
                                    <form:input path="payment" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Thời hạn thuê</label>
                                <div class="col-xs-9">
                                    <form:input path="rentTime" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Thời gian trang trí</label>
                                <div class="col-xs-9">
                                    <form:input path="decorationTime" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Tên quản lý</label>
                                <div class="col-xs-9">
                                    <form:input path="managerName" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">SĐT quản lý</label>
                                <div class="col-xs-9">
                                    <form:input path="managerPhone" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Phí môi giới</label>
                                <div class="col-xs-9">
                                    <form:input path="brokerageFee" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Loại toà nhà</label>
                                <div class="col-xs-9">
                                    <form:checkboxes path="typeCode" items="${typeCodes}"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3">Ghi chú</label>
                                <div class="col-xs-9">
                                    <form:input path="note" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 no-padding-right">Hình đại diện</label>
                                <input class="col-sm-3 no-padding-right" type="file" id="uploadImage"/>
                                <div class="col-sm-9">
                                    <c:if test="${not empty buildingEdit.image}">
                                        <c:set var="image" value="/repository${buildingEdit.image}"/>
                                        <img src="${image}" id="viewImage" width="300px" height="300px" style="margin-top: 50px">
                                    </c:if>
                                    <c:if test="${empty buildingEdit.image}">
                                        <img src="/admin/image/default.png" id="viewImage" width="300px" height="300px">
                                    </c:if>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3"></label>
                                <div class="col-xs-9">
                                    <c:if test="${empty buildingEdit.id}" >
                                        <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding">
                                            Thêm toà nhà
                                        </button>
                                    </c:if>
                                    <c:if test="${not empty buildingEdit.id}" >
                                        <button type="button" class="btn btn-warning" id="btnAddOrUpdateBuilding">
                                            Sửa toà nhà
                                        </button>
                                        <script>
                                            console.log("buildingEdit.id:", "${buildingEdit.id}");
                                        </script>


                                    </c:if>

                                    <a href="/admin/building-list">
                                        <button type="button" class="btn btn-primary">
                                            Huỷ thao tác
                                        </button>
                                    </a>
                                </div>
                            </div>


                        </form>
                    </div>
                </form:form>

            </div>
        </div>
    </div><!-- /.row -->
</div><!-- /.page-content -->
</div>
<script>
    var imageBase64 = '';
    var imageName = '';
    $('#btnAddOrUpdateBuilding').click(function(){
        var data = {};
        var typeCode = [];
        var formData = $('#form-edit').serializeArray();
        $.each(formData, function(i,it){
            if(it.name != 'typeCode') {
                data["" + it.name + ""] = it.value;
            }
            else {
                typeCode.push(it.value);
            }
            if ('' !== imageBase64) {
                data['imageBase64'] = imageBase64;
                data['imageName'] = imageName;
            }

        });
        data['id']= "${buildingEdit.id}";
        data['typeCode'] = typeCode;
        console.table(data);
        if (typeCode.length == 0) return alert("Loại toà nhà không được thiếu");
        $('#loading_image').show();

        btnAddOrUpdate(data);
    });
    function btnAddOrUpdate(data) {
        $.ajax({
            type: "POST",
            url: "/api/buildings",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "text",
            success:(response) => {
                // $('#loading_image').hide();
                alert(response);
                // showMessageConfirmation("Thành công", "Thao tác thành công!", "success", "/admin/building-edit-" + res.id);
                window.location.replace("/admin/building-list");
            },
            error: function(response){
                $('#loading_image').hide();
                console.log("failed");
                console.log(response);
                // var redirectUrl = (null === buildingId) ? "" : "/admin/building-edit-" + {buildingId};
                // showMessageConfirmation("Thất bại", "Đã có lỗi xảy ra! Vui lòng kiểm tra lại.", "warning", redirectUrl);
            }
        });
    }




    $("#cancelBtn").click(function () {
        showAlertBeforeCancelForm(function() {
            window.location.href = '/admin/building-list';
        })
    });

    $('#uploadImage').change(function (event) {
        var reader = new FileReader();
        var file = $(this)[0].files[0];
        reader.onload = function(e){
            imageBase64 = e.target.result;
            imageName = file.name; // ten hinh khong dau, khoang cach. vd: a-b-c
        };
        reader.readAsDataURL(file);
        openImage(this, "viewImage");
    });

    function openImage(input, imageView) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#' +imageView).attr('src', reader.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
</body>
</html>
