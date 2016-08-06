<%@include file="navigation.jsp" %>
<!-- ================================================ HEADER ======================================================= -->
<header>
    <div class="container no-padding">

        <div class="col-xs-12 col-sm-12 col-md-3 logo-holder">
            <!-- ============================================================= LOGO ============================================================= -->
            <div class="logo">
                <a href="/">
                    <img alt="hmccnc.com" src="../../resources/images/vmc_and_hmc.svg" width="233" height="54"/>
                </a>
            </div>
            <!-- /.logo -->
            <!-- ============================================================= LOGO : END ============================================================= -->
        </div>
        <!-- /.logo-holder -->

        <div class="col-xs-12 col-sm-12 col-md-5 top-search-holder no-margin">
            <div class="contact-row">
                <div class="phone inline">
                    <i class="fa fa-phone"></i> <spring:message code="common.usa"/>: <span class="le-color">+1 203 556-50-69</span><br>
                </div>
                <br>
                <div class="contact inline">
                    <i class="fa fa-envelope"></i> contact@<span class="le-color">hmccnc.com</span>
                </div>
            </div>
            <!-- /.contact-row -->
        </div>
        <!-- /.top-search-holder -->

        <div class="col-xs-12 col-sm-12 col-md-4 top-cart-row no-margin">
            <div class="top-cart-row-container">
                <div class="wishlist-compare-holder">
                    <div class="wishlist">
                        <a onclick="goToWishList()"><i class="fa fa-heart"></i> <spring:message code="common.wishList"/> <span
                                id="wishList-value"></span> </a>
                    </div>
                    <div class="compare">
                        <a onclick="goToComparison()"><i class="fa fa-exchange"></i> <spring:message code="common.comparison"/> <span
                                id="compare-value"></span> </a>
                    </div>
                </div>

                <!-- ============================================================= SHOPPING CART DROPDOWN ============================================================= -->
                <div class="top-cart-holder dropdown animate-dropdown">

                    <div class="basket">

                        <a class="dropdown-toggle" data-toggle="dropdown">
                            <div class="basket-item-count">
                                <span class="count" id="cart-count"></span>
                                <img src="../../resources/images/icon-cart.png"/>
                            </div>

                            <div class="total-price-basket">
                                <span class="lbl"><spring:message code="common.cart"/></span>
                                <span class="total-price" <c:if test='${pageContext.request.userPrincipal.name == null}'>style="display: none"</c:if>>
                                    <span class="sign">$</span><span class="value cart-total">0</span>
                                </span>
                            </div>
                        </a>

                        <ul class="dropdown-menu">
                            <c:forEach var="i" begin="1" end="3">
                            <li id="li${i}" class="hidden">
                                <div class="basket-item">
                                    <div class="row">
                                        <div class="col-xs-4 col-sm-4 no-margin text-center">
                                            <div class="thumb">
                                                <img width="75" height="75" src="../../resources/images/blank.gif">
                                            </div>
                                        </div>
                                        <div class="col-xs-8 col-sm-8 no-margin">
                                            <div class="title"></div>
                                            <div class="price" <c:if test="${pageContext.request.userPrincipal.name == null}">style="display: none"</c:if>></div>
                                        </div>
                                    </div>
                                    <a class="close-btn" onclick="window.location.reload(true);"></a>
                                </div>
                            </li>
                            </c:forEach>
                            <li class="checkout">
                                <div class="basket-item">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-6">
                                            <a class="le-button" onclick="goToCart()"><spring:message code="common.viewCart"/></a>
                                        </div>
                                        <div class="col-xs-12 col-sm-6">
                                            <a onclick="goToCheckout()" class="checkout-btn le-button"><spring:message code="common.checkout"/></a>
                                            <span class="checkout-btn-inverse le-button inverse" style="cursor: auto"><spring:message code="common.checkout"/></span>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <!--/.basket-->
                </div>

                <!-- /.top-cart-holder -->
            </div>
            <!-- /.top-cart-row-container -->
            <!-- ============================================================= SHOPPING CART DROPDOWN : END ============================================================= -->
        </div>
        <!-- /.top-cart-row -->

    </div>
    <!-- /.container -->
</header>
<!-- =============================================== HEADER : END ================================================ -->