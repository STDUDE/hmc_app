<%@ page language="java" contentType="text/javascript; charset=UTF-8" pageEncoding="UTF-8"%>

        $(document).ready(function () {
            if (sessionStorage.slidersUrl != null && sessionStorage.slidersUrl != "") {
                loadFilterSlidersParams();
            } else {
                loadDefaultSliders(slidersNames);
            }
            if (sessionStorage.checkboxesUrl != null && sessionStorage.checkboxesUrl != "") {
                loadFilterCheckboxesParams();
            }
        });

        function loadDefaultSliders(slidersLeft) {
            $(specificSlidersNames).each(function(index, value){
                if(slidersLeft.indexOf(value) != -1) {
                    loadSlider(value, slidersDefaultRange[value][0], slidersDefaultRange[value][1], specificSliders[value], "");
                    slidersLeft = $.grep(slidersLeft, function(item){
                        return item != value;
                    });
                }
            });
            $(slidersLeft).each(function (index, value) {
                loadSlider(value, slidersDefaultRange[value][0], slidersDefaultRange[value][1], commonStep, "");
            });
        }

        function loadFilterSlidersParams() {
            var slidersLeft = slidersNames;
            var sliders = sessionStorage.slidersUrl.split('&');
            $(sliders).each(function (index, value) {
                slidersLeft = $.grep(slidersLeft, function(item){
                    return item != value;
                });
                var val = value.split('=');
                var minDefault = slidersDefaultRange[val[0]][0];
                var maxDefault = slidersDefaultRange[val[0]][1];
                $(specificSlidersNames).each(function(index, value){
                    if(val[0] == value) {
                        loadSlider(val[0], minDefault, maxDefault, specificSliders[val[0]], val[1]);
                    }
                });
                loadSlider(val[0], minDefault, maxDefault, commonStep, val[1]);
            });
            loadDefaultSliders(slidersLeft);
        }

        function loadSlider(nameVal, minVal, maxVal, stepVal, valueVal) {
            var thisSlider = $('#' + nameVal + '-slider');
            if (valueVal != "" && valueVal != (minVal + "," + maxVal)) {
                thisSlider.val(valueVal);
            }
            valueVal = (valueVal == "") ? [minVal, maxVal] : valueVal.split(",").map(Number);
            thisSlider.slider({min: parseInt(minVal), max: parseInt(maxVal), step: stepVal, value: valueVal});
        }

        function loadFilterCheckboxesParams() {
            var checkboxes = sessionStorage.checkboxesUrl.split('&');
             $(checkboxes).each(function (index, value) {
                var val = value.split('=');
                loadCheckbox(val[0], val[1]);
            });
        }

        function loadCheckbox(name, data) {
            var arr = data.split(',');
            $('input[name=' + name + ']').each(function () {
                $(this).prop('checked', arr.indexOf($(this).val()) != -1);
            });
        }

        function submitFilter() {
            saveSlidersUrl();
            saveFilterCheckboxesUrl();
            sessionStorage.page = "1";
            goToHmc();
        }

        function saveSlidersUrl() {
            var url = "";
            $(slidersNames).each(function (index, value) {
                var currentRange = $('#' + value + '-slider').val();
                if (currentRange != "" && shouldBeFilteredSlider(currentRange, value)) {
                    url += value + '=' + currentRange + '&';
                }
            });
            if(url != "") {
                url = url.substring(0, url.length - 1);
            }
            sessionStorage.slidersUrl = url;
        }

        function shouldBeFilteredSlider(current, name) {
            var minMax = current.split(',');
            return minMax[0] != slidersDefaultRange[name][0] || minMax[1] != slidersDefaultRange[name][1];
        }

        function saveFilterCheckboxesUrl() {
            var url = "";
            $(checkboxesNames).each(function (index, value) {
                if (shouldBeFilteredCheckbox(value)) {
                    url += value + '=' + getCheckbox(value) + '&';
                }
            });
            if(url != "") {
                url = url.substring(0, url.length - 1);
            }
            sessionStorage.checkboxesUrl = url;
        }

        function shouldBeFilteredCheckbox(name) {
            var checkedExist = false;
            $('input[name=' + name + ']').each(function () {
                if (this.checked) {
                    checkedExist = true;
                }
            });
            return checkedExist;
        }

        function getCheckbox(name) {
            var data = "";
            $('input[name=' + name + ']').each(function () {
                data += this.checked ? (this.value + ",") : "";
            });
            if(data != "") {
                data = data.substring(0, data.length - 1);
            }
            return data;
        }

        function resetFilter() {
            sessionStorage.slidersUrl = "";
            sessionStorage.checkboxesUrl = "";
            goToHmc();
        }



