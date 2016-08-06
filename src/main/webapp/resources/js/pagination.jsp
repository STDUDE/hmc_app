<%@ page language="java" contentType="text/javascript; charset=UTF-8" pageEncoding="UTF-8"%>

        var currentPage ;

        $(document).ready(function () {
            currentPage = parseInt(sessionStorage.page);
            toggleItems(currentPage);
            toggleCurrentClassPage(currentPage);
            setSpanFromTo();
        });

        function showPage(page) {
            toggleItems(currentPage);
            toggleItems(page);
            toggleCurrentClassPage(currentPage);
            toggleCurrentClassPage(page);
            currentPage = page;
            setSpanFromTo();
            sessionStorage.page = page.toString();
        }

        function showPageAndGoUp(page) {
            showPage(page);
            $('html, body').animate({
                scrollTop: $("#top").offset().top
            }, 500);
        }

        function toggleItems(page) {
            var perPage = sessionStorage.perPageUrl.split('=')[1];
            for (i = (page - 1) * perPage + 1; i <= itemsNum && i <= page * perPage; i++) {
                $('.item' + i).toggleClass('hidden');
            }
        }

        function toggleCurrentClassPage(page) {
            $('#page' + page).toggleClass("current");
        }

        function setSpanFromTo() {
            var perPage = sessionStorage.perPageUrl.split('=')[1];
            var from = (currentPage - 1) * perPage + 1;
            var to = currentPage * perPage;
            if (to > itemsNum) {
                to = itemsNum;
            }
            $('#showFromTo').text(function () {
                if (from == to)
                    return from.toString();
                return from.toString() + '-' + to.toString();
            });
            $('#of').text(function () {
                return itemsNum.toString();
            });
        }
