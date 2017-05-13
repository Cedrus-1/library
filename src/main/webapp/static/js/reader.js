/*$( function () {
    var btn = $("#btn_update_save");
    btn.click( function () {
        update();
    });

})*/

function update() {
    if (!validUpdate()) {
        return;
    }
/*/!*    var reader={
        readerID: $.trim($("#update_id").val()),
        sex: $.trim($("#update_sex").val()),
        age: $.trim($("#update_age").val()),
        phone: $.trim($("#update_phone").val()),
        password: $.trim($("#update_password_new").val())
    };*/

    var message = JSON.stringify({
        message : {
            readerID:$("#update_id").val(),
            sex: $("#update_sex").val(),
            age: $("#update_age").val(),
            phone: $.trim($("#update_phone").val()),
            password: $.trim($("#update_password_new").val())
        },
        type : "message"
    });
    $.ajax({
        type: 'POST',
        url: '/reader/update',
        cache: false,
        data: {
            message:JSON.stringify({
                message : {
                    readerID: $.trim($("#update_id").val()),
                    sex: $.trim($("#update_sex").val()),
                    age: $.trim($("#update_age").val()),
                    phone: $.trim($("#update_phone").val()),
                    password: $.trim($("#update_password_new").val())
                },
                type : "message"
            })
        },
        dataType:'json',
        success: function (data) {
            if (data == 1) {
                showInfo("更新成功");
            }else if (data == -1) {
                showInfo("原密码不正确");
            } else {
                showInfo("操作失败，请重试");
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            showInfo("操作失败，请重试");
        }
    });
}

function validUpdate() {
    var flag = true;

    var update_password = $.trim($("#update_password").val());

    if (update_password!=null && update_password.length > 20) {
        $("#update_password").parent().parent().addClass("has-error");
        $("#update_password").next().text("密码长度不能大于20");
        flag = false;
    } else {
        $("#update_password").parent().parent().removeClass("has-error");
        $("#update_password").next().text("");
    }


    return flag;
}

function showInfo(msg) {
    $("#div_info").text(msg);
    $("#modal_info").modal('show');
}