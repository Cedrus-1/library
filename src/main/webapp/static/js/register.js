$(function () {
    $('#login_submit').click(function () {
        if (!validLogin()) {
            return;
        }

        $.ajax({
            type: 'POST',
            url: '/register',
            cache: false,
            data: {
                username: $.trim($("#username").val()),
                password: $.trim($("#password").val()),
                phone: $("#phone").val()
            },
            success: function (data) {
                if (data == 1) {
                    window.location.href =  "/reader/index";
                } else if (data == -1) {
                    showInfo("此用户名太火了，已经被注册了！");
                } else {
                    showInfo("注册失败，请重试");
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                showInfo("注册失败，请重试");
            }
        });
    });

    var alert = $('.alert');
    var formWidth = $('.bootstrap-admin-login-form').innerWidth();
    var alertPadding = parseInt($('.alert').css('padding'));
    if (isNaN(alertPadding)) {
        alertPadding = parseInt($(alert).css('padding-left'));
    }
    $('.alert').width(formWidth - 2 * alertPadding);
});

function validLogin() {
    var flag = true;

    var username = $.trim($("#username").val());
    if (username == "") {
        $('#username').parent().addClass("has-error");
        $('#username').next().text("请输入账号");
        $("#username").next().show();
        flag = false;
    } else if (username.length > 20) {
        $("#username").parent().addClass("has-error");
        $("#username").next().text("账号长度不能大于20");
        $("#username").next().show();
        flag = false;
    } else {
        $('#username').parent().removeClass("has-error");
        $('#username').next().text("");
        $("#username").next().hide();
    }

    var password = $.trim($("#password").val());
    if (password == "") {
        $('#password').parent().addClass("has-error");
        $('#password').next().text("请输入密码");
        $("#password").next().show();
        flag = false;
    } else if (password.length > 20) {
        $("#password").parent().addClass("has-error");
        $("#password").next().text("密码长度不能大于20");
        $("#password").next().show();
        flag = false;
    } else {
        $('#password').parent().removeClass("has-error");
        $('#password').next().text("");
        $("#password").next().hide();
    }

    var phone = $.trim($("#phone").val());
    if (phone == "") {
        $('#phone').parent().addClass("has-error");
        $('#phone').next().text("请输入账号");
        $("#phone").next().show();
        flag = false;
    } else if (!(/^1[34578]\d{9}$/.test(phone)) ) {
        $("#phone").parent().addClass("has-error");
        $("#phone").next().text("手机号码有误，请重填");
        $("#phone").next().show();
        flag = false;
    } else {
        $('#phone').parent().removeClass("has-error");
        $('#phone').next().text("");
        $("#phone").next().hide();
    }
    return flag;
}

function showInfo(msg) {
    $("#div_info").text(msg);
    $("#modal_info").modal('show');
}