$(function () {
    $('.khoisanpham').slick({
        dots: false,
        infinite: false,
        speed: 300,
        slidesToShow: 5,
        slidesToScroll: 1,
        responsive: [
            {
                breakpoint: 1400,
                settings: {
                    slidesToShow: 3,
                    slidesToScroll: 1,
                    infinite: true,
                    dots: true
                }
            },
            {
                breakpoint: 800,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 480,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            }
        ]
    });

    //hieu ung header va nut backtotop
    $("#backtotop").click(function () {
        $("html, body").animate({ scrollTop: 0 }, 400);
    });

    $(window).scroll(function () {
        if ($("body,html").scrollTop() > 150) {
            $(".navbar").addClass("fixed-top");
        }
        else {
            $(".navbar").removeClass("fixed-top");
        }
    });

    $(window).scroll(function () {
        if ($("body,html").scrollTop() > 500) {
            $(".nutcuonlen").addClass("hienthi");
        }
        else {
            $(".nutcuonlen").removeClass("hienthi");
        }
    });

    // header form dangnhap dangky
    $(".nutdangnhap").click(function (e) {
        $("ul.tabs .tab-dangnhap").addClass("active");
    });
    $(".nutdangky").click(function (e) {
        $("ul.tabs .tab-dangky").addClass("active");
    });

    $("ul.tabs .tab-dangnhap").click(function (e) {
        $("ul.tabs .tab-dangnhap").addClass("active");
        $("ul.tabs .tab-dangky").removeClass("active");
    });

    $("ul.tabs .tab-dangky").click(function (e) {
        $("ul.tabs .tab-dangky").addClass("active");
        $("ul.tabs .tab-dangnhap").removeClass("active");
    });

    // form dangnhap dangky 
    $(".tab-dangky").click(function (e) {
        $('#formdangnhap').removeClass("fade");
        $('#formdangky').removeClass("fade");
        $('#formdangnhap').modal("hide");
        $('#formdangky').modal("show");
    });
    $(".tab-dangnhap").click(function (e) {
        $('#formdangnhap').removeClass("fade");
        $('#formdangky').removeClass("fade");
        $('#formdangky').modal("hide");
        $('#formdangnhap').modal("show");
    });
    $(".close").click(function (e) {
        $('.modal').addClass("fade");
        $("ul.tabs .tab-dangnhap").removeClass("active");
        $("ul.tabs .tab-dangky").removeClass("active");
    });

	$("#form-signin").validate({
        rules: {
            pass: {
                required: true,
                minlength: 1
            },
            email: {
                required: true,
                email: true
            }
        },
        messages: {
            pass: {
                required: 'Vui lòng nhập mật khẩu',
                minlength: 'Vui lòng nhập ít nhất 6 kí tự'
            },
            email: {
                required: "Vui lòng nhập email",
                minlength: "Email không hợp lệ",
                email: "Vui lòng nhập email",
            }
        }
    });
    
    $("#form-signup").validate({
		rules: {
			user: {
				required: true,
			},
			name: {
				required: true,
			},
			sdt: {
				required: true,
				minlength: 8
			},
			pass: {
				required: true,
				minlength: 1
			},
			confirm_password: {
				required: true,
				minlength: 1,
				equalTo: "#InputPassword"
			},
			email: {
				required: true,
				email: true
			}
		},
		messages: {
			user: {
				required: "Vui lòng nhập tên đăng nhập",
			},
			name: {
				required: "Vui lòng nhập họ và tên",
			},
			sdt: {
				required: "Vui lòng nhập số điện thoại",
				minlength: "Số máy quý khách vừa nhập là số không có thực"
			},
			pass: {
				required: 'Vui lòng nhập mật khẩu',
				minlength: 'Vui lòng nhập ít nhất 6 kí tự'
			},
			confirm_password: {
				required: 'Vui lòng nhập lại mật khẩu',
				minlength: 'Vui lòng nhập ít nhất 6 kí tự',
				equalTo: 'Mật khẩu không trùng'
			},
			email: {
				required: "Vui lòng nhập email",
				minlength: "Email không hợp lệ",
				email: "Vui lòng nhập email",
			}
		}
	});
	
	$(".btn-inc").click(function (e) {
      	var strval = $(this).parent().prev().val();
       	var val = parseInt(strval) + 1;
        $(this).parent().prev().attr('value', val);
    });
    $(".btn-dec").click(function (e) {
        var strval = $(this).parent().next().val();
        var val = parseInt(strval) - 1;
        if (val < 1) {
            $(this).parent().next().attr('value', 1);
        } else {
            $(this).parent().next().attr('value', val);
        }
    });
	
    //rotate chevron
    $('#step1contentid').on('show.bs.collapse', function () {
        $(this).prev().addClass("active");
    })
    $('#step1contentid').on('hide.bs.collapse', function () {
        $(this).prev().removeClass("active");
    })
    $('#step2contentid').on('show.bs.collapse', function () {
        $(this).prev().addClass("active");
    })
    $('#step2contentid').on('hide.bs.collapse', function () {
        $(this).prev().removeClass("active");
    })
    $('#step3contentid').on('show.bs.collapse', function () {
        $(this).prev().addClass("active");
    })
    $('#step3contentid').on('hide.bs.collapse', function () {
        $(this).prev().removeClass("active");
    })

    // nut btn-shopping-without-signup
    $("#step1contentid").collapse('show');
    $(".btn-shopping-without-signup").click(function (e) {
        $("#step1contentid").collapse('hide');
        $("#step2contentid").collapse('show');
    });
	
});
