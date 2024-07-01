<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<link rel="stylesheet" type="text/css" href="/css/info/info.css">

<section class="creative-cards style-one">
    <div class="container">
        <div class="row">
            <div class="card-column">
                <div class="card-details">
                    <div class="card-icons">
                        <img class="light-icon" src="/images/hotel.jpeg" alt="icon" />
                    </div>
                    <h3><a href="<c:url value="/info/hinfo"/>">숙소 예약 사이트</a></h3>
                    <p>전국 최저가 사이트 비교하기</p>
                    <a class="read-more-btn" href="<c:url value="/info/hinfo"/>"><i class="bi bi-chevron-double-right"></i></a>
                </div>
            </div>
            <div class="card-column">
                <div class="card-details">
                    <div class="card-icons">
                        <img class="light-icon" src="/images/bus.jpeg" alt="icon" />
                    </div>
                    <h3><a href="<c:url value="/info/tinfo"/>">교통</a></h3>
                    <p>여행 목적지 까지 교통편 티켓 예매하기</p>
                    <a class="read-more-btn" href="<c:url value="/info/tinfo"/>"><i class="bi bi-chevron-double-right"></i></a>
                </div>
            </div>
            <div class="card-column">
                <div class="card-details">
                    <div class="card-icons">
                        <img class="light-icon" src="/images/ticket.jpeg" alt="icon" />
                    </div>
                    <h3><a href="https://www.fiverr.com/aliali44">레저 및 티켓</a></h3>
                    <p>레저 티켓 예매하기</p>
                    <a class="read-more-btn" href=""><i class="bi bi-chevron-double-right"></i></a>
                </div>
            </div>
        </div>
    </div>
</section>