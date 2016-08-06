
<%@ page language="java" contentType="text/javascript; charset=UTF-8" pageEncoding="UTF-8"%>

        $(document).ready(function () {
            if(localStorage.comparedIdStr != null && localStorage.comparedIdStr != "" ) {
                loadStyledCompareItems();
            }
            styleCompareValue();
            createPopovers();
            if(localStorage.wishListIdStr != null && localStorage.wishListIdStr != "" ) {
                loadStyledWishListItems();
            }
            styleWishListValue();
            if(localStorage.cartItemStr != null && localStorage.cartItemStr != "" ) {
                loadStyledCartItems();
                styleCounts();
                loadBasketDropdown();
            } else {
                localStorage.cartTotal = "0";
                localStorage.cartCount = "0";
                $(".checkout-btn").addClass("hidden");
                $(".checkout-btn-inverse").removeClass("hidden");
            }
            styleCartValue();
        });

        <%-- COMMON --%>

        function styleValue(arr,id){
            $(id).text( arr != null && arr != "" ? '('+arr.split(',').length+')' : '' );
        }

        function goTo(href,arr) {
            if (arr != null && arr != "") {
                window.location.href = href + "?itemsId=" + arr;
            } else {
                window.location.href = href;
            }
        }

        function removeFromArr(arrStr,productId) {
            var arr = arrStr.split(',');
            arr = $.grep(arr, function (value) {
                return value != productId;
            });
            return (arr.length != 0) ? arr.join() : "";
        }

        <%-- COMPARISON --%>

        function loadStyledCompareItems(){
            var comparedIdArr = localStorage.comparedIdStr.split(',');
            $(comparedIdArr).each(function(index,value){
                styleComparisonButton(value);
            });
        }

        function styleCompareValue(){
            styleValue(localStorage.comparedIdStr,'#compare-value');
        }

        function addToComparison(productId) {
            var comparedIdArr = [];
            if (localStorage.comparedIdStr != null && localStorage.comparedIdStr != "") {
                comparedIdArr = localStorage.comparedIdStr.split(',');
            }
            if (comparedIdArr.length < 4) {
                comparedIdArr.push(productId);
                localStorage.comparedIdStr = comparedIdArr.join();
                styleComparisonButton(productId);
                styleCompareValue();
            } else {
                $("#compare"+productId).popover('show');
            }
        }

        function removeFromComparison(productId) {
            localStorage.comparedIdStr = removeFromArr(localStorage.comparedIdStr,productId);
            styleComparisonButton(productId);
            styleCompareValue();
        }

        function styleComparisonButton(productId) {
            var thisSpan = $(".compare"+productId);
            thisSpan.toggleClass("hidden");
            styleCompareValue();
        }

        function createPopovers() {
            var popoverItem = $(".btn-add-to-compare");
            popoverItem.popover({
                placement: 'auto right',
                trigger: 'manual',
                html: true,
                content: '<b>You may compare up to 4 items at a time</b><br><br>' +
                        'Would you like to compare the first 4 items you have selected?<br><br>' +
                        '<a href="#" onclick="goToComparison()">Yes, go to compare</a>'
            });
            popoverItem.on('shown.bs.popover', function () {
                setTimeout(function () {
                    popoverItem.popover('hide');
                }, 3500);
            });

        }

        <%-- WISHLIST --%>

        function loadStyledWishListItems(){
            var wishListIdArr = localStorage.wishListIdStr.split(',');
            $(wishListIdArr).each(function(index,value){
                styleWishListButton(value);
            });
        }

        function styleWishListValue(){
            styleValue(localStorage.wishListIdStr,'#wishList-value');
        }

        function addToWishList(productId) {
            var wishListIdArr = [];
            if (localStorage.wishListIdStr != null && localStorage.wishListIdStr != "") {
                wishListIdArr = localStorage.wishListIdStr.split(',');
            }
            wishListIdArr.push(productId);
            localStorage.wishListIdStr = wishListIdArr.join();
            styleWishListButton(productId);
            styleWishListValue();
        }

        function removeFromWishListAndReloadPage(productId) {
            localStorage.wishListIdStr = removeFromArr(localStorage.wishListIdStr, productId);
            goToWishList();
        }

        function removeFromWishList(productId) {
            localStorage.wishListIdStr = removeFromArr(localStorage.wishListIdStr,productId);
            styleWishListButton(productId);
            styleWishListValue();
        }

        function styleWishListButton(productId) {
            var thisSpan = $(".wishList"+productId);
            thisSpan.toggleClass("hidden");
            styleWishListValue();
        }

        <%-- CART --%>

        function loadStyledCartItems(){
            var cartItemArr = localStorage.cartItemStr.split(';');
            $(cartItemArr).each(function(index,value){
                var productId = value.split(',')[0];
                styleCartButton(productId);
            });
        }

        function styleCartValue(){
            var count = localStorage.cartCount.toString();
            $('#cart-count').text(count > 0 ? count : "");
            $('.cart-total').text(localStorage.cartTotal.toString());
        }

        function getArrOfId(fullStr) {
            var fullArr = fullStr.split(';');
            if(fullArr != null && fullArr != "") {
                var arrOfId = "";
                $(fullArr).each(function (index,value) {
                    var productId = value.split(',')[0];
                    arrOfId += productId + ",";
                });
                arrOfId = arrOfId.substring(0,arrOfId.length - 1);
            }
            return arrOfId;
        }

        function addToCart(productId) {
            var cartItemArr = [];
            if (localStorage.cartItemStr != null && localStorage.cartItemStr != "") {
                cartItemArr = localStorage.cartItemStr.split(';');
            }
            var price = $('.price'+productId).first().text();
            var photo = $('.photo'+productId).first().text();
            var model = $('.model'+productId).first().text();
            var brand = $('.brand'+productId).first().text();
            cartItemArr.push(productId+","+price+",1,"+photo+","+model+","+brand);
            localStorage.cartItemStr = cartItemArr.join(";");
            localStorage.cartTotal = (parseInt(localStorage.cartTotal) + parseInt(price)).toString();
            localStorage.cartCount = (parseInt(localStorage.cartCount) + 1).toString();
            styleCartButton(productId);
            styleCartValue();
            loadBasketDropdown();
        }

        function removeFromCart(productId) {
            var arr = localStorage.cartItemStr.split(';');
            var item;
            $.each(arr,function(index,value){
                if(value.split(',')[0] == productId) {
                    item = value;
                }
            });
            arr = $.grep(arr, function (value) {
                return value != item;
            });
            localStorage.cartItemStr = (arr.length != 0) ? arr.join(";") : "";
            var price = item.split(',')[1];
            var count = item.split(',')[2];
            localStorage.cartTotal = (parseInt(localStorage.cartTotal) - price * count).toString();
            localStorage.cartCount = (parseInt(localStorage.cartCount) - count).toString();
            styleCartButton(productId);
            styleCartValue();
            loadBasketDropdown();
        }

        function styleCounts() {
            var arr = localStorage.cartItemStr.split(';');
            $.each(arr,function(index,value){
                var item = value.split(',');
                $(".count"+item[0]).val(item[2]);
            });
        }

        function styleCartButton(productId) {
            var thisSpan = $(".cart"+productId);
            thisSpan.toggleClass("hidden");
        }

        function minusFromCart(productId) {
            var arr = localStorage.cartItemStr.split(';');
            var changed = false;
            var price;
            var count;
            for(var i=0; !changed && i<arr.length; ++i) {
                if(arr[i].split(',')[0] == productId) {
                    var item = arr[i].split(',');
                    price = parseInt(item[1]);
                    count = item[2];
                    --count;
                    if(count < 1) {
                        arr = $.grep(arr, function (value) {
                            return value != item;
                        });
                    } else {
                        arr[i] = item[0]+','+item[1]+','+count+','+item[3]+','+item[4]+','+item[5];
                    }
                    changed = true;
                }
            }
            localStorage.cartItemStr = (arr.length != 0) ? arr.join(";") : "";
            localStorage.cartTotal = (parseInt(localStorage.cartTotal) - price).toString();
            localStorage.cartCount = (parseInt(localStorage.cartCount) - 1).toString();
            styleCartValue();
            if(count < 1) {
                goToCart();
            }
        }

        function plusToCart(productId) {
            var arr = localStorage.cartItemStr.split(';');
            var changed = false;
            var price;
            for(var i=0; !changed && i<arr.length; ++i) {
                if(arr[i].split(',')[0] == productId) {
                    var item = arr[i].split(',');
                    price = parseInt(item[1]);
                    var count = item[2];
                    ++count;
                    arr[i] = item[0]+','+item[1]+','+count+','+item[3]+','+item[4]+','+item[5];
                    changed = true;
                }
            }
            localStorage.cartItemStr = (arr.length != 0) ? arr.join(";") : "";
            localStorage.cartTotal = (parseInt(localStorage.cartTotal) + price).toString();
            localStorage.cartCount = (parseInt(localStorage.cartCount) + 1).toString();
            styleCartValue();
        }

        function loadBasketDropdown(){
            if(localStorage.cartItemStr != null && localStorage.cartItemStr != "") {
                var arr = localStorage.cartItemStr.split(';');
                for (var i = 0; i < 3; ++i) {
                    if (i < arr.length) {
                        var machine = arr[i].split(',');
                        $("#li" + (i + 1)).removeClass("hidden");
                        $("#li" + (i + 1) + " img").attr("src", "../resources/images/products/" + machine[3]);
                        $("#li" + (i + 1) + " img").attr("alt", machine[4]);
                        $("#li" + (i + 1) + " .title").html(machine[4] + '<br>' + machine[5]);
                        $("#li" + (i + 1) + " .price").text("$" + machine[1] + ".00");
                        $("#li" + (i + 1) + " .close-btn").click(function () {
                            removeFromCart(machine[0]);
                        });
                    } else {
                        $("#li" + (i + 1)).addClass("hidden");
                    }
                }
                $(".checkout-btn").removeClass("hidden");
                $(".checkout-btn-inverse").addClass("hidden");
            } else {
                $("#li1").addClass("hidden");
                $("#li2").addClass("hidden");
                $("#li3").addClass("hidden");
                $(".checkout-btn").addClass("hidden");
                $(".checkout-btn-inverse").removeClass("hidden");
            }
        }

        function toEmptyTheCart() {
            localStorage.cartItemStr = "";
            localStorage.cartTotal = "0";
            localStorage.cartCount = "0";
            styleCartValue();
            loadBasketDropdown();
        }

        <%-- OTHER --%>

        function goToProposal() {
            var arrOfId = getArrOfId(localStorage.cartItemStr);
            goTo("/hmc/proposal",arrOfId);
        }

        function goToCheckout() {
            var arrOfId = getArrOfId(localStorage.cartItemStr);
            goTo("/hmc/checkout",arrOfId);
        }

        function goToComparison() {
            goTo("/hmc/compare",localStorage.comparedIdStr);
        }

        function goToWishList() {
            goTo("/hmc/wishList",localStorage.wishListIdStr);
        }

        function goToCart() {
            var arrOfId = getArrOfId(localStorage.cartItemStr);
            goTo("/hmc/cart",arrOfId);
        }

        function goToHmc() {
            var url = "";
            var arr = [sessionStorage.slidersUrl, sessionStorage.checkboxesUrl, sessionStorage.perPageUrl];
            arr = $.grep(arr, function(value){
                return value != null && value != "";
            });
            url = arr.join("&");
            url = "/hmc" + (url != "" ? ("?" + url) : "")
            window.location.href = url;
        }

        <%-- LANGUAGE --%>

        function changeLanguage(lang){
            $("body").css("cursor", "progress");
            $.get("/hmc?lang="+lang, function(){
                location.reload();
                $("body").css("cursor", "normal");
            })
        }

