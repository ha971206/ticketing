<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>

<div class="container-md">
    <div class="row">
        <div class="col">

            <c:if test="${not empty message }">
                <div class="alert alert-success">
                        ${message }
                </div>
            </c:if>

            <h1>${customer.customerName}님의 회원 정보 수정하기</h1>

            <form id="form1" action="" method="post">

                <div class="mb-3">
                    <label for="" class="form-label">
                        이름
                    </label>
                    <input class="form-control" type="text" value="${customer.customerName }" readonly>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label">
                        생년월일
                    </label>
                    <input class="form-control" type="text" value="${customer.customerBirth }" readonly>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label">
                        아이디
                    </label>
                    <input class="form-control" type="text" value="${customer.customerId }" readonly>
                </div>

                <div class="mb-3" class="form-label">
                    <label for="" class="form-label">
                        비밀번호
                    </label>
                    <input class="form-control" type="password" value="${customer.customerPassword}" readonly>
                </div>
                <button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#passwordModal">
                    비밀번호 변경하기
                </button>

                <div class="mb-3">
                    <label for="" class="form-label">
                        이메일
                    </label>
                    <div>
                        <input class="form-control" type="email" value="${customer.customerEmail }" readonly>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label">
                        핸드폰 번호
                    </label>
                    <div>
                        <input class="form-control" type="text" value="${customer.customerPhoneNumber }" readonly>
                    </div>

                </div>
                <button type="button" class="btn btn-outline-secondary">핸드폰 번호 변경하기</button>


                <div class="mb-3">
                    <label for="" class="form-label">
                        주소
                    </label>

                    <div>
                        <input class="form-control" type="text" value="${customer.customerAddress }" readonly>
                    </div>
                </div>
                <button type="button" class="btn btn-outline-secondary">주소 변경하기</button>


                <div class="mb-3">
                    <label for="" class="form-label">
                        등급
                    </label>
                    <input class="form-control" type="text" value="${customer.customerGrade }" readonly>
                </div>

                <div class="mb-3" >
                    <label for="" class="form-label">
                        가입일시
                    </label>
                    <input class="form-control" type="datetime-local" value="${customer.customerInserted}" readonly>
                </div>
            </form>

        </div>
    </div>
</div>

<%-- 비밀번호 변경 모달창 --%>
<div class="modal fade" id="passwordModal" tabindex="-1" aria-labelledby="passwordModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="passwordModalLabel">비밀번호 변경하기</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="passwordForm" action="passwordModify" method="post">
                    <div class="mb-3">
                        <label for="" class="form-label">
                            비밀번호
                        </label>
                        <input id="customerPasswordInput1" class="form-control" type="password" name="customerPassword" onkeyup="noSpaceForm(this)" onchange="noSpaceForm(this)">
                        <div style="color: red" id="customerPasswordText1" class="form-text"></div>
                        <input id="test" type="hidden" name="customerUniqueNumber" value="${customer.customerUniqueNumber}">
                    </div>
                </form>

                <div class="mb-3">
                    <label for="" class="form-label">
                        비밀번호 확인
                    </label>
                    <input id="customerPasswordInput2" class="form-control" type="password" onkeyup="noSpaceForm(this)" onchange="noSpaceForm(this)">
                    <div style="color: red" id="customerPasswordText2" class="form-text"></div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button id="modalConfirmPasswordButton" type="button" class="btn btn-primary">수정</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous">
</script>

<script>
    const ctx = "${pageContext.request.contextPath}";

    let checkedPassword = false;
    let checkedPassword1 = false;
    let checkedPassword2 = false;
    let checkedPhoneNumber = false;
    let checkedAddress = false;

    document.querySelector("#modalConfirmPasswordButton").addEventListener("click", function(e) {
        e.preventDefault();

        if (checkedPassword && checkedPassword1 && checkedPassword2) {
            document.getElementById('passwordForm').submit();
        } else if (checkedPassword1 == false) {
            customerPasswordText1.innerText = "비밀번호를 작성해주세요"
            document.getElementById("customerPasswordInput1").focus();
        } else if (checkedPassword2 == false) {
            customerPasswordText2.innerText = "비밀번호를 한번 더 작성해주세요"
            document.getElementById("customerPasswordInput2").focus();
        } else if (checkedPassword == false) {
            customerPasswordText2.innerText = "비밀번호가 일치하지 않습니다"
            document.getElementById("customerPasswordInput2").focus();
        }
    })

    // input 값이 모두 입력되었는지 확인
    const customerPasswordInput1 = document.querySelector("#customerPasswordInput1");
    const customerPasswordInput2 = document.querySelector("#customerPasswordInput2");
    const customerPhoneNumberInput = document.querySelector("#customerPhoneNumberInput");
    const customerAddressInput = document.querySelector("#customerAddressInput");

    const customerPasswordText1 = document.querySelector("#customerPasswordText1");
    const customerPasswordText2 = document.querySelector("#customerPasswordText2");
    const customerPhoneNumberText = document.querySelector("#customerPhoneNumberText");
    const customerAddressText = document.querySelector("#customerAddressText");

    // 비밀번호 일치하는지 확인
    function matchPassword() {
        checkedPassword = false;

        const samePassword1 = customerPasswordInput1.value;
        const samePassword2 = customerPasswordInput2.value;

        if (samePassword1 == samePassword2) {
            customerPasswordText2.innerText = "비밀번호가 일치합니다"
            customerPasswordText2.removeAttribute("style");
            checkedPassword = true;
        } else {
            customerPasswordText2.innerText = "비밀번호가 일치하지 않습니다"
            customerPasswordText2.setAttribute("style", "color:red");
        }
    }

    document.querySelector("#customerPasswordInput1").addEventListener("keyup", matchPassword);
    document.querySelector("#customerPasswordInput2").addEventListener("keyup", matchPassword);

    function matchPassword1() {

        checkedPassword1 = false;

        const password1 = customerPasswordInput1.value;

        if (password1 == "") {
            customerPasswordText1.innerText = "비밀번호를 작성해주세요"
            customerPasswordText1.setAttribute("style", "color:red");
            customerPasswordText2.innerText = ""
        } else {
            customerPasswordText1.innerText = ""
            checkedPassword1 = true;
        }
    }

    document.querySelector("#customerPasswordInput1").addEventListener("keyup", matchPassword1);

    function matchPassword2() {
        checkedPassword2 = false;

        const password2 = customerPasswordInput2.value;

        if (password2 == "") {
            customerPasswordText2.innerText = "비밀번호를 한번 더 작성해주세요"
            customerPasswordText2.setAttribute("style", "color:red");
        } else {
            checkedPassword2 = true;
        }
    }

    document.querySelector("#customerPasswordInput2").addEventListener("keyup", matchPassword2);

    function matchPhoneNumber() {
        checkedPhoneNumber = false;

        const phoneNumber = customerPhoneNumberInput.value;

        if (phoneNumber == "") {
            customerPhoneNumberText.innerText = "핸드폰 번호를 작성해주세요"
            customerPhoneNumberText.setAttribute("style", "color:red");
        } else {
            customerPhoneNumberText.innerText = ""
            checkedPhoneNumber = true;
        }
    }

    document.querySelector("#customerPhoneNumberInput").addEventListener("keyup", matchPhoneNumber);

    function matchAddress() {
        checkedAddress = false;

        const address = document.form.customerAddressInput.value;

        if (address == "") {
            customerAddressText.innerText = "주소를 입력해주세요"
            customerAddressText.setAttribute("style", "color:red");
        } else {
            customerAddressText.innerText = ""
            checkedAddress = true;
        }
    }

    document.querySelector("#customerAddressInput").addEventListener("keyup", matchAddress);

    function noSpaceForm(obj) { // 공백사용못하게
        var str_space = /\s/;  // 공백체크
        if(str_space.exec(obj.value)) { //공백 체크
            //alert("해당 항목에는 공백을 사용할수 없습니다.\n\n공백은 자동적으로 제거 됩니다.");
            obj.focus();
            obj.value = obj.value.replace(/\s| /gi,''); // 공백제거
            return false;
        }
    }

    function goPopup(){
        // 주소검색을 수행할 팝업 페이지를 호출합니다.
        // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
        var pop = window.open("/customer/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes");

        // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
        //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");
    }

    function jusoCallBack(customerAddressInput){
        // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
        document.form.customerAddressInput.value = customerAddressInput;

    }


</script>


</body>
</html>
