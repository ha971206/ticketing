<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ attribute name="active" %>

<link rel="stylesheet" href="/static/css/all.min.css">
<!-- https://fontawesome.com/ -->
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
<!-- https://fonts.google.com/ -->
<link href="/ticketing/static/css/bootstrap.min.css" rel="stylesheet">
<link href="/ticketing/static/css/templatemo-xtra-blog.css" rel="stylesheet">

<style>
    .effect-lily img {
        opacity: 100;
    }

    #myBtn {
        display: none; /* Hidden by default */
        position: fixed; /* Fixed/sticky position */
        bottom: 20px; /* Place the button at the bottom of the page */
        right: 30px; /* Place the button 30px from the right */
        z-index: 99; /* Make sure it does not overlap */
        border: none; /* Remove borders */
        outline: none; /* Remove outline */
        background-color: red; /* Set a background color */
        color: white; /* Text color */
        cursor: pointer; /* Add a mouse pointer on hover */
        padding: 15px; /* Some padding */
        border-radius: 10px; /* Rounded corners */
        font-size: 18px; /* Increase font size */
    }

    #myBtn:hover {
        background-color: #555; /* Add a dark-grey background on hover */
    }

    .tm-post-link-inner {
        background: none;
    }

    /*글씨체*/
    @font-face {
        font-family: 'LINESeedKR-Bd';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
        font-weight: 700;
        font-style: normal;
    }

    .up {
        display: block;
        transition: all 0.3s ease-out;
    }

    .up:hover {
        transform: translateY(-50px);
    }

</style>

<header class="tm-header" id="tm-header" style="width:320px">
    <div class="tm-header-wrapper">
        <button class="navbar-toggler" type="button" aria-label="Toggle navigation">
            <i class="fas fa-bars"></i>
        </button>
        <div style="margin-bottom: auto" class="tm-site-header">
            <div class="mb-3 mx-auto tm-site-logo"><img src="/ticketing/static/oo.ico"/></div>
            <h1 class="text-center"><strong>A</strong> <strong>R</strong>aboza <strong>T</strong>eam</h1>
        </div>
        <div>
            <div style="margin-bottom: 30px" class="tm-mb-65">
                <div>
                    <sec:authentication property="name" var="username"/>
                        <p style="color:white; margin-bottom: 0px; margin-top: 30px">
                            <i class="fa-regular fa-face-grin-wide"></i>
                            ${username}님
                        </p>
                        <div class="d-grid gap-2 d-md-flex justify-content-md-start">
                            <div style="width: auto">
                                <a style="color: white" class="font-weight-light" href="/ticketing/customer/get?customerId=${username}">내정보</a> |
<%--                                <a style="color: white" class="font-weight-light" href="/customer/reservation">예약확인</a> --%>
                                <a style="color: white" href="/ticketing/logout">로그아웃</a>
                            </div>
                        </div>
                </div>
            </div>
        </div>
        <nav class="tm-nav" id="tm-nav">
            <ul>
                <li class="tm-nav-item">
                    <a href="/ticketing/content/list" class="tm-nav-link">
                        <i class="fas fa-home"></i>
                        전시회
                    </a>
                </li>
                <sec:authentication property="name" var="username"/>
                <c:if test="${'admin' == username}">
                    <li class="tm-nav-item">
                        <a href="/ticketing/content/register" class="tm-nav-link">
                            <i class="fas fa-pen"></i>
                            게시물 작성
                        </a>
                    </li>
                </c:if>
                <sec:authentication property="name" var="username"/>
                <c:if test="${'admin' == username}">
                    <li class="tm-nav-item">
                        <a href="/ticketing/admin/customerManage" class="tm-nav-link">
                            <i class="fa-regular fa-address-card"></i>
                            회원 정보 관리
                        </a>
                    </li>
                </c:if>
                <sec:authentication property="name" var="username"/>
                <c:if test="${'admin' == username}">
                    <li class="tm-nav-item">
                        <a href="/ticketing/admin/customerList" class="tm-nav-link">
                            <i class="fa-solid fa-list-ul"></i>
                            회원 목록
                        </a>
                    </li>
                </c:if>
                <li class="tm-nav-item">
                    <a href="/ticketing/admin/about" class="tm-nav-link">
                        <i class="fas fa-users"></i>
                        About
                    </a>
                </li>
                <li class="tm-nav-item" style="margin-bottom: 230px">
                    <a href="http://pf.kakao.com/_WAlfxj/chat" class="tm-nav-link" target="_blank">
                        <i class="fa-solid fa-comment"></i>
                        문의하기
                    </a>
                </li>
            </ul>
        </nav>

        <%-- github --%>
        <div style="margin: 10px; color : #0cc; !important;" class="">
            <div style="margin-bottom: 10px">
                <%-- JWS --%>
                <a href="https://github.com/WonsikJung13" target="_blank" class="">
                    <div style=" float: left; margin-right: 15px" class="up">
                        <i style="margin-left: 3px;; font-size: 30px;" class="fa-regular fa-face-meh-blank"></i>
                        <div style="font-family: LINESeedKR-Bd; font-size: 15px; color: white">JWS</div>
                    </div>
                </a>
                <%-- LSG --%>
                <a href="https://github.com/gmlrmrtjd" target="_blank" class="">
                    <div style=" float: left; margin-right: 15px" class="up">
                        <i style="margin: auto; font-size: 30px;" class="fa-regular fa-face-grimace"></i>
                        <div style="font-family: LINESeedKR-Bd; font-size: 15px; color: white">LSG</div>
                    </div>
                </a>
                <%-- LCE --%>
                <a href="https://github.com/Limdaram" target="_blank" class="">
                    <div style=" float: left; margin-right: 15px" class="up">
                        <i style="margin: auto; font-size: 30px;" class="fa-regular fa-face-laugh-beam"></i>
                        <div style="font-family: LINESeedKR-Bd; font-size: 15px; color: white">LCE</div>
                    </div>
                </a>
                <%-- HHJ --%>
                <a href="https://github.com/ha971206" target="_blank" class="">
                    <div style=" float: left; margin-right: 15px;" class="up">
                        <i style="margin: auto; font-size: 30px;" class="fa-regular fa-face-surprise"></i>
                        <div style="font-family: LINESeedKR-Bd; font-size: 15px; color: white">HHJ</div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</header>

<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
<script>
    // Get the button:
    let mybutton = document.getElementById("myBtn");

    // When the user scrolls down 20px from the top of the document, show the button
    window.onscroll = function () {
        scrollFunction()
    };

    function hiddenFunction() {
        if (document.body.scrollLeft > 1300 || document.documentElement.scrollTop > 1300) {
            mybutton.style.display = "block";
        } else{
            mybutton.style.display = "none";
        }
    }

    function scrollFunction() {
        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
            mybutton.style.display = "block";
        } else{
            mybutton.style.display = "none";
        }
    }

    // When the user clicks on the button, scroll to the top of the document
    function topFunction() {
        document.body.scrollTop = 0; // For Safari
        document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
    }

</script>

<script src="/ticketing/static/js/jquery.min.js"></script>
<script src="/ticketing/static/js/templatemo-script.js"></script>